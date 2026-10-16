"""Bundle a checksum-verified private Node/npm distribution; never use a user's PATH runtime."""
import hashlib,json,platform,shutil,tarfile,tempfile,urllib.request,zipfile
from pathlib import Path
version='24.14.1'
kind='win-x64' if platform.system()=='Windows' else 'linux-x64'
name=f'node-v{version}-{kind}';ext='.zip' if kind.startswith('win') else '.tar.xz'
base=f'https://nodejs.org/dist/v{version}/'
checks=urllib.request.urlopen(base+'SHASUMS256.txt').read().decode()
expected=next(line.split()[0] for line in checks.splitlines() if line.split()[-1]==name+ext)
with tempfile.TemporaryDirectory() as d:
 archive=Path(d)/(name+ext);urllib.request.urlretrieve(base+name+ext,archive)
 assert hashlib.sha256(archive.read_bytes()).hexdigest()==expected,'Node checksum mismatch'
 if ext=='.zip':
  with zipfile.ZipFile(archive) as z:z.extractall(d)
 else:
  with tarfile.open(archive) as t:t.extractall(d,filter='data')
 source=Path(d)/name;target=Path('runtime');shutil.rmtree(target,ignore_errors=True);target.mkdir()
 if kind.startswith('win'):
  shutil.copy2(source/'node.exe',target/'node.exe');shutil.copytree(source/'node_modules/npm',target/'node_modules/npm')
 else:
  (target/'bin').mkdir();shutil.copy2(source/'bin/node',target/'bin/node');shutil.copytree(source/'lib/node_modules/npm',target/'lib/node_modules/npm')
 (target/'release.json').write_text(json.dumps({'version':version,'platform':kind,'sha256':expected}))
print('Private runtime verified and staged:',kind,version)
