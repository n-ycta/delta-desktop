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

## Install the latest release

Run **one command for your operating system** as your normal user. These repository-hosted installers resolve GitHub's latest stable release at installation time; they are not pinned to the version mentioned in this README. Re-run the same command to upgrade. Each installer downloads the native application and verifies its SHA-256 against that release's `SHA256SUMS` before installation.

### Linux x86_64

```sh
curl -fsSL https://raw.githubusercontent.com/n-ycta/delta-desktop/main/install.sh | sh
```

Launch **Delta** from your application menu, or run `~/.local/bin/delta-desktop`. Installation is per-user under `~/.local/share/delta-desktop` (or `XDG_DATA_HOME`). No root service is created. FUSE 2 is required for AppImage; run `APPIMAGE_EXTRACT_AND_RUN=1 ~/.local/bin/delta-desktop` if FUSE is unavailable.

### Windows x64 · PowerShell

```powershell
irm https://raw.githubusercontent.com/n-ycta/delta-desktop/main/install.ps1 | iex
```

The installer opens the current-user setup wizard. No administrator elevation is requested. The EXE is **not Authenticode-signed**, so Windows may display SmartScreen. Verify the repository and checksum before proceeding; do not disable your organization's security policy.

These commands execute the published installer script. If you prefer, download and inspect [install.sh](install.sh) or [install.ps1](install.ps1) before running it. Set `DELTA_DESKTOP_VERSION` only when deliberately pinning an older stable version. Internet access to GitHub is required.

### Manual download

- [Latest Windows installer](https://github.com/n-ycta/delta-desktop/releases/latest/download/Delta-Desktop-windows-x86_64.exe)
- [Latest Linux AppImage](https://github.com/n-ycta/delta-desktop/releases/latest/download/Delta-Desktop-linux-x86_64.AppImage)
- [Latest SHA256SUMS](https://github.com/n-ycta/delta-desktop/releases/latest/download/SHA256SUMS)
- [Release notes](https://github.com/n-ycta/delta-desktop/releases/latest)

## First run and everyday use

The app opens its OS-owned local node through private IPC; a browser account or Web plugin is not required. Use **Settings → Core connection** to pair a reachable VPS/desktop node using its URL and invitation code. Pairing only fills the invitation fields until you explicitly join. Grant incoming administrative access only to a device you trust.

Install optional service plugins on the appropriate node and choose that service node explicitly. A missing plugin disables only the features depending on it. Plugin settings, dashboards and EN/RU UI are shared with Web and Android.

Closing the window keeps the node in the tray. Choose **Exit** from the tray to stop the embedded node; an attached external Core is not stopped. Login startup and system notifications are opt-in. Application updates preserve the node profile. Uninstalling the application does not intentionally delete your data: back up the profile before manually deleting it, and never run two GUI processes against the same profile.

## Networking and limits

A newly embedded Core binds to loopback. Pairing allows this app to call a reachable remote Core; it does not create a VPN, open firewall ports or make loopback reachable by other devices. For bidirectional inbound access, run/configure a normal Core profile with an appropriate listener and advertised address over HTTPS or a trusted private network.

Independent signed UI activation/rollback and application binary self-update are not enabled. UI updates ship with native app releases. Unsupported role reassignment and live connection editing are reported explicitly, not simulated. There is no physical Windows/Linux machine acceptance claim from CI alone.

## Build

Install Rust, Node 24 and platform Tauri prerequisites. Run `npm ci --ignore-scripts`, `python scripts/prepare-runtime.py`, then `npx tauri build --bundles appimage` on Linux or `--bundles nsis` on Windows. Source revisions are fixed in `package-lock.json` and `src-tauri/Cargo.lock`.
