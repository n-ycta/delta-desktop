Native Windows x64 and Linux x86_64 clients with embedded Rust Core, a shared immutable-pinned Delta UI and bundled private Node/npm for plugins. No Web plugin or system Node installation is required.

- Full shared management UI over credential-private IPC.
- Tray lifecycle, optional login startup and system notifications.
- QR image pairing, explicit service-node selection, native JSON exports and external browser links.
- Persistent node identity, dashboards and preferences.
- Independent headless MCP/updater/provisioning/observability plugins remain optional and capability-gated.

Download the AppImage or per-user NSIS EXE and verify SHA256SUMS. Linux and Windows install scripts are included. The Windows EXE is not Authenticode-signed and may trigger SmartScreen. AppImage requires FUSE 2 or APPIMAGE_EXTRACT_AND_RUN=1.

Release gates include native startup, profile persistence, private runtime and installing/running headless MCP without Web on CI. Shared UI routes are also exercised against a real embedded Core through a browser harness. CI is not a physical-device test.

New profiles bind to loopback; pairing does not provide NAT traversal. Independent signed UI activation and native binary self-update are not enabled. Unsupported operations and mobile-only restrictions are not simulated. See README for boundaries.
