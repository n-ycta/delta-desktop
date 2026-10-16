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
cat > "${XDG_DATA_HOME:-$HOME/.local/share}/applications/dev.delta.desktop.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Delta
Exec="$dir/Delta.AppImage" %u
Terminal=false
Categories=Utility;Network;
MimeType=x-scheme-handler/delta;
DESKTOP
command -v update-desktop-database >/dev/null && update-desktop-database "${XDG_DATA_HOME:-$HOME/.local/share}/applications" || true
command -v xdg-mime >/dev/null && xdg-mime default dev.delta.desktop.desktop x-scheme-handler/delta || true
printf 'Installed Delta %s. Launch ~/.local/bin/delta-desktop. AppImage requires FUSE 2; APPIMAGE_EXTRACT_AND_RUN=1 is an alternative.\n' "$VERSION"
