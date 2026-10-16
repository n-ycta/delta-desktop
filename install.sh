#!/bin/sh
set -eu
VERSION=${DELTA_DESKTOP_VERSION:-}
if [ -z "$VERSION" ]; then
  VERSION=$(curl -fsSL --proto '=https' --tlsv1.2 https://api.github.com/repos/n-ycta/delta-desktop/releases/latest | sed -n 's/.*"tag_name": *"v\([0-9][0-9.]*\)".*/\1/p')
fi
VERSION=${VERSION#v}
printf '%s\n' "$VERSION" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$' || { echo 'Cannot resolve a stable Desktop release' >&2; exit 1; }
[ "$(uname -s)" = Linux ] && [ "$(uname -m)" = x86_64 ] || { echo 'Linux x86_64 required' >&2; exit 1; }
command -v curl >/dev/null; command -v sha256sum >/dev/null
base="https://github.com/n-ycta/delta-desktop/releases/download/v$VERSION"
dir="${XDG_DATA_HOME:-$HOME/.local/share}/delta-desktop";tmp=$(mktemp -d);trap 'rm -rf "$tmp"' EXIT HUP INT TERM
curl -fL --proto '=https' --tlsv1.2 "$base/Delta-Desktop-linux-x86_64.AppImage" -o "$tmp/Delta-Desktop-linux-x86_64.AppImage"
curl -fL --proto '=https' --tlsv1.2 "$base/SHA256SUMS" -o "$tmp/SHA256SUMS"
(cd "$tmp"; grep '  Delta-Desktop-linux-x86_64.AppImage$' SHA256SUMS | sha256sum -c -)
mkdir -p "$dir" "$HOME/.local/bin" "${XDG_DATA_HOME:-$HOME/.local/share}/applications"
chmod 755 "$tmp/Delta-Desktop-linux-x86_64.AppImage";mv "$tmp/Delta-Desktop-linux-x86_64.AppImage" "$dir/Delta.AppImage"
printf '#!/bin/sh\nexec "%s" "$@"\n' "$dir/Delta.AppImage" > "$HOME/.local/bin/delta-desktop";chmod 755 "$HOME/.local/bin/delta-desktop"
# Older releases do not include the icon asset; the installer carries the same brand source.
if grep -q '  delta-logo.svg$' "$tmp/SHA256SUMS"; then
  curl -fL --proto '=https' --tlsv1.2 "$base/delta-logo.svg" -o "$tmp/delta-logo.svg"
  (cd "$tmp"; grep '  delta-logo.svg$' SHA256SUMS | sha256sum -c -)
else
  cat > "$tmp/delta-logo.svg" <<'DELTA_ICON'
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path d="M66.80,80.25 L8.00,80.25 L50.00,7.50 L79.40,58.42" fill="none" stroke="#6D5DFC" stroke-width="13" stroke-linejoin="round" stroke-linecap="round"/><circle cx="89.00" cy="78.25" r="8.06" fill="#FF6A3D"/></svg>
DELTA_ICON
fi
icon_dir="${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/scalable/apps"
mkdir -p "$icon_dir"; cp "$tmp/delta-logo.svg" "$icon_dir/dev.delta.desktop.svg"
cat > "${XDG_DATA_HOME:-$HOME/.local/share}/applications/dev.delta.desktop.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Delta
Exec="$dir/Delta.AppImage" %u
Icon=dev.delta.desktop
Terminal=false
Categories=Utility;Network;
MimeType=x-scheme-handler/delta;
DESKTOP
command -v update-desktop-database >/dev/null && update-desktop-database "${XDG_DATA_HOME:-$HOME/.local/share}/applications" || true
command -v xdg-mime >/dev/null && xdg-mime default dev.delta.desktop.desktop x-scheme-handler/delta || true
printf 'Installed Delta %s. Launch ~/.local/bin/delta-desktop. AppImage requires FUSE 2; APPIMAGE_EXTRACT_AND_RUN=1 is an alternative.\n' "$VERSION"
