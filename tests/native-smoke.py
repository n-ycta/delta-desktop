"""Launch a built native host in an isolated profile; exercise its real Core and private runtime."""
import hashlib,json,os,secrets,signal,socket,subprocess,sys,tempfile,time,urllib.request
from pathlib import Path
out=Path('acceptance');out.mkdir(exist_ok=True)
with tempfile.TemporaryDirectory(prefix='delta-desktop-acceptance-') as d:
 home=Path(d);secret=secrets.token_hex(32);node_id=secrets.token_hex(8)
 with socket.socket() as s:s.bind(('127.0.0.1',0));port=s.getsockname()[1]
 config={'node_id':node_id,'name':'Native acceptance','node_kind':'desktop','listen':'127.0.0.1','port':port,'url':f'http://127.0.0.1:{port}','tokens':[{'id':'acceptance','name':'ephemeral acceptance','hash':hashlib.sha256(secret.encode()).hexdigest(),'scopes':['admin']} ]}
 p=home/'config.json';p.write_text(json.dumps(config));p.chmod(0o600);(home/'admin.token').write_text(secret);(home/'admin.token').chmod(0o600)
 env={**os.environ,'DELTA_HOME':str(home),'WEBKIT_DISABLE_DMABUF_RENDERER':'1'}
 log=open(out/'host.log','wb');proc=None
 def call(cap,args={}):
  req=urllib.request.Request(f'http://127.0.0.1:{port}/v1/call',data=json.dumps({'capability':cap,'args':args}).encode(),headers={'Content-Type':'application/json','Authorization':'Bearer '+secret});v=json.load(urllib.request.urlopen(req,timeout=20));assert v['ok'],v.get('error');return v['result']
 def start():
  global proc
  proc=subprocess.Popen([str(Path(sys.argv[1]).resolve())],env=env,stdout=log,stderr=log,start_new_session=os.name!='nt')
  for _ in range(90):
   if proc.poll() is not None:raise AssertionError('Native host exited during startup')
   try:
    info=call('core.info');assert info['node_id']==node_id;return info
   except (OSError,ValueError):time.sleep(1)
  raise AssertionError('Native Core did not start')
 def stop():
  global proc
  if proc and proc.poll() is None:
   if os.name=='nt':proc.terminate()
   else:os.killpg(proc.pid,signal.SIGTERM)
   try:proc.wait(timeout=15)
   except subprocess.TimeoutExpired:proc.kill();proc.wait()
  proc=None
 try:
  info=start();node=home/'runtime'/('node.exe' if os.name=='nt' else 'bin/node');assert node.is_file(),'Private runtime must be bundled';version=subprocess.check_output([str(node),'--version'],text=True).strip();assert version=='v24.14.1'
  catalog=call('packages.catalog');assert any(p['id']=='dev.delta.mcp' for p in catalog['plugins'])
  result=call('packages.install',{'id':'dev.delta.mcp'});job=None
  for _ in range(150):
   jobs=call('packages.jobs');job=next((j for j in jobs if j['id']==result['jobId']),None)
   if job and job['status'] in ['complete','failed']:break
   time.sleep(2)
  assert job and job['status']=='complete',job
  assert isinstance(call('mcp.list'),list),'Headless MCP must work without Web'
  call('supervisor.stop',{'id':'mcp'});time.sleep(1)
  if os.name!='nt':subprocess.run(['import','-window','root',str(out/'linux.png')],check=False)
  stop();start();assert call('core.info')['node_id']==node_id
  (out/'result.json').write_text(json.dumps({'startup':True,'nodeIdentityPersistent':True,'privateNode':version,'pluginInstall':True,'headlessMcpWithoutWeb':True,'platform':sys.platform},indent=2));print((out/'result.json').read_text())
 finally:stop();log.close()
