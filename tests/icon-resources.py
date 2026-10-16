"""Source-resource checks; installer/window/tray validation requires native acceptance."""
from pathlib import Path
import struct,json
root=Path(__file__).resolve().parents[1];config=json.loads((root/'src-tauri/tauri.conf.json').read_text())
for name in config['bundle']['icon']:assert (root/'src-tauri'/name).is_file()
for size in [32,128,256,512]:
 raw=(root/f'src-tauri/icons/{size}x{size}.png').read_bytes();assert raw[:8]==b'\x89PNG\r\n\x1a\n';assert struct.unpack('>II',raw[16:24])==(size,size)
raw=(root/'src-tauri/icons/icon.ico').read_bytes();reserved,kind,count=struct.unpack('<HHH',raw[:6]);assert (reserved,kind)==(0,1);assert count>=6
assert 'Icon=dev.delta.desktop' in (root/'install.sh').read_text();assert (root/'branding/delta-logo.svg').is_file()
print('PASS: Tauri icon references, PNG sizes, multi-resolution ICO and Linux desktop entry')
