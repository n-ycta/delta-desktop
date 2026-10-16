# Delta Desktop

Native Windows x64 and Linux x86_64 application with an embedded Rust Core and the shared, immutable-pinned `delta-ui`. It does not load a remote Web panel and does not require the Web plugin or a system Node.js installation.

## Application

- Full shared interface: nodes, plugin catalog/settings/actions/tables, dashboards, access and contracts.
- MCP, updates, SSH provisioning and observability use independent service plugins over the capability API. Select their node explicitly in Settings → Connection. Missing dependencies stay unavailable.
- Owner credentials remain in Rust. The privileged document uses bounded IPC; remote plugin HTML frames remain disabled.
- A checksum-verified private Node/npm runtime is bundled for desktop plugins. Existing runtime files are not silently overwritten.
- Reuses `DELTA_HOME`, otherwise `~/.delta` on Linux and `%LOCALAPPDATA%\Delta` on Windows. A running compatible Core is attached only after identity verification. The profile lease prevents duplicate GUI ownership.
- Closing the window hides it to the tray. Exit stops an embedded node, not an attached external Core. Login startup is optional.
- QR invitation images, `delta://pair` links, explicit incoming administrative trust, native export/share, external browser links and opt-in system notifications.

## Installation

Download the AppImage or per-user NSIS EXE from GitHub Releases and verify `SHA256SUMS`. The Linux `install.sh` and Windows `install.ps1` scripts are pinned to the release version and verify the downloaded binary. Inspect scripts before executing them. No administrator rights are required by these scripts.

The EXE is **not Authenticode-signed**; Windows may display SmartScreen. Linux requires a desktop session, WebKitGTK-compatible distribution and FUSE 2 for AppImage; `APPIMAGE_EXTRACT_AND_RUN=1` is an alternative where FUSE is unavailable.

## Networking and limits

A newly embedded Core binds to loopback. Pairing allows this app to call a reachable remote Core; it does not create a VPN, open firewall ports or make loopback reachable by other devices. For bidirectional inbound access, run/configure a normal Core profile with an appropriate listener and advertised address over HTTPS or a trusted private network.

Independent signed UI activation/rollback and application binary self-update are not enabled. UI updates ship with native app releases. Unsupported role reassignment and live connection editing are reported explicitly, not simulated. There is no physical Windows/Linux machine acceptance claim from CI alone.

## Build

Install Rust, Node 24 and platform Tauri prerequisites. Run `npm ci --ignore-scripts`, `python scripts/prepare-runtime.py`, then `npx tauri build --bundles appimage` on Linux or `--bundles nsis` on Windows. Source revisions are fixed in `package-lock.json` and `src-tauri/Cargo.lock`.
