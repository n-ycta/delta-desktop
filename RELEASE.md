## Version 0.1.3

- Pin shared UI 0.2.0: full Console, composable workbench, four themes and
  templates, responsive dock, compact hideable host controls, editable overview.
- Bundle verified Media 0.1.0-alpha.3 with radio presets and reusable shared
  application surfaces. Existing libraries and workspace layouts survive asset updates.
- Retain host permission boundaries; composition never grants plugin permissions.
- Native background audio and cross-device media-library sync are not claimed.

Native Windows x64 and Linux x86_64 clients with embedded Rust Core, a shared immutable-pinned Delta UI and bundled private Node/npm for plugins. No Web plugin or system Node installation is required.

- Internal same-origin navigation remains inside the bundled application; real external HTTP(S) links use the OS browser.
- Explicit personal-key onboarding and Phosphor interface icons from shared Delta UI.
- Canonical SVG brand with platform PNG/ICO resources and a checksummed Linux desktop icon.
- Full shared management UI over credential-private IPC.
- Tray lifecycle, optional login startup and system notifications.
- QR image pairing, explicit service-node selection, native JSON exports and external browser links.
- Persistent node identity, dashboards and preferences.
- Independent headless MCP/updater/provisioning/observability plugins remain optional and capability-gated.

Download the AppImage or per-user NSIS EXE and verify SHA256SUMS. One-command latest-release installation for Linux and Windows is documented in the repository README; installers are hosted in the repository rather than required as release attachments. The Windows EXE is not Authenticode-signed and may trigger SmartScreen. AppImage requires FUSE 2 or APPIMAGE_EXTRACT_AND_RUN=1.

Release gates include native startup, profile persistence, private runtime and installing/running headless MCP without Web on CI. Shared UI routes are also exercised against a real embedded Core through a browser harness. CI is not a physical-device test.

New profiles bind to loopback; pairing does not provide NAT traversal. Independent signed UI activation and native binary self-update are not enabled. Unsupported operations and mobile-only restrictions are not simulated. See README for boundaries.

Shared UI 0.2.0 adds durable display name, nickname and avatar settings and recovery phrases hidden by default with copy and native Markdown export. Portable static apps use isolated per-app origins with no owner credential access. This release passed installed Linux and Windows startup acceptance; Media background playback and cross-device library synchronization are not claimed.
