## Version 0.1.11

- Pin shared Delta UI 0.3.2 (0935e3f) automatically (ui-sync).
- Preserve the authenticated shell through transient Web restarts; distinguish actual authorization rejection and localize reconnect feedback.
- Acknowledge update actions immediately, refresh active jobs every second, group components in collapsible node sections, highlight progress and expose bounded cross-node parallelism when supported.
- Preserve a single plugin frame across visible surfaces and suppress stale already-open placeholders.
- Add screen-scale magnetic window snapping with alignment guides and Alt bypass; commit layout changes only at gesture end.
- Add Studio address/search and back/forward/reload controls, with an external-browser fallback for sites that refuse framing.
- Back up and migrate only redundant whole-app Console/Media desktops; retain customized arrangements.
- Update the verified Media UI catalog to 0.3.6 and permit the explicit browse capability.
- Add actual-component reconnect, update, snapping and frame-ownership browser regressions.
- The platform limitations below remain unchanged.

## Version 0.1.10

- Pin shared Delta UI 0.3.1 (7d88a05) automatically (ui-sync).
- Reflow the mobile plugin catalog into fluid cards, a two-column tab selector and a dedicated search/filter toolbar at 320px and wider.
- Center segmented-control icons explicitly and provide 44px touch targets.
- Keep the mobile dock manager reachable with a short label, aligned navigation slots and a separate now-playing row.
- Remove the unrelated history-service notice from the catalog; keep history guidance on history screens.
- Add RU/EN light/dark browser checks for mobile overflow, icon centers, hit-testing, installation controls, manager and hidden-dock reveal.
- The platform limitations below remain unchanged.

## Version 0.1.9

- Pin shared Delta UI 0.3.0 (5a000ee) automatically (ui-sync).
- Update the Media catalog to the verified 0.3.5 UI package.
- Allow only the six explicit offline-cache capabilities through the Media UI broker; keep unrelated operations denied.
- The platform limitations below remain unchanged.

## Version 0.1.8

- Pin shared Delta UI 0.3.0 (ed4f03f) automatically (ui-sync).
- One global dock outside every app: Console, installed apps and desktops; configurable position (left/right/top/bottom/hidden), size, labels, order and pinning; context menu (open, pin, rename, duplicate, delete, stop, uninstall); bottom bar on phones.
- “All apps” manager: installed apps appear automatically after installation, catalog install/update, desktop previews and template gallery, dock constructor, theme.
- Apps and desktops are separate concepts; Console and Media are no longer “desktops”. New “Home” desktop with clock, quick launch, now playing and tips.
- Running apps live above the router: music keeps playing when switching apps, desktops or Console pages; mini-player in the dock.
- One global theme for the system and apps: Catppuccin Latte (Manrope), Gruvbox Light (Golos Text + Literata), Catppuccin Mocha (Onest), Tokyo Night (JetBrains Mono); tokens are passed to app frames (`applyThemeTokens`).
- Dashboard “App” widget embeds an installed app with the usual move/resize.
- SDK: media session (`reportMedia`, `onMediaCommand`) and catalog-governed intents between apps (`sendIntent`, `onIntent`).
- Fix: the launcher “Apps” and “Settings” buttons opened the same dialog; distinct icons for Console, desktops and templates.
- Fix: the toast container no longer covers top-right controls; overlays are anchored to the stage, above the global dock.
- Catalog: Delta Media 0.2.0 (player, receives `media.play`/`media.enqueue`) and new source apps Delta YouTube, Delta SoundCloud, Delta Spotify 0.1.0 (send those intents). App CSP allows the official SoundCloud and Spotify embeds.
- The platform limitations below remain unchanged.

## Version 0.1.7

- Pin shared Delta UI 0.3.0 (d278f0f) automatically (ui-sync).
- One global dock outside every app: Console, installed apps and desktops; configurable position (left/right/top/bottom/hidden), size, labels, order and pinning; context menu (open, pin, rename, duplicate, delete, stop, uninstall); bottom bar on phones.
- “All apps” manager: installed apps appear automatically after installation, catalog install/update, desktop previews and template gallery, dock constructor, theme.
- Apps and desktops are separate concepts; Console and Media are no longer “desktops”. New “Home” desktop with clock, quick launch, now playing and tips.
- Running apps live above the router: music keeps playing when switching apps, desktops or Console pages; mini-player in the dock.
- One global theme for the system and apps: Catppuccin Latte (Manrope), Gruvbox Light (Golos Text + Literata), Catppuccin Mocha (Onest), Tokyo Night (JetBrains Mono); tokens are passed to app frames (`applyThemeTokens`).
- Dashboard “App” widget embeds an installed app with the usual move/resize.
- SDK: media session (`reportMedia`, `onMediaCommand`) and catalog-governed intents between apps (`sendIntent`, `onIntent`).
- Fix: the launcher “Apps” and “Settings” buttons opened the same dialog; distinct icons for Console, desktops and templates.
- Fix: the toast container no longer covers top-right controls; overlays are anchored to the stage, above the global dock.
- Catalog: Delta Media 0.2.0 (player, receives `media.play`/`media.enqueue`) and new source apps Delta YouTube, Delta SoundCloud, Delta Spotify 0.1.0 (send those intents). App CSP allows the official SoundCloud and Spotify embeds.
- The platform limitations below remain unchanged.

## Version 0.1.6

- Pin shared Delta UI 0.3.0 (0333a6b) automatically (ui-sync).
- One global dock outside every app: Console, installed apps and desktops; configurable position (left/right/top/bottom/hidden), size, labels, order and pinning; context menu (open, pin, rename, duplicate, delete, stop, uninstall); bottom bar on phones.
- “All apps” manager: installed apps appear automatically after installation, catalog install/update, desktop previews and template gallery, dock constructor, theme.
- Apps and desktops are separate concepts; Console and Media are no longer “desktops”. New “Home” desktop with clock, quick launch, now playing and tips.
- Running apps live above the router: music keeps playing when switching apps, desktops or Console pages; mini-player in the dock.
- One global theme for the system and apps: Catppuccin Latte (Manrope), Gruvbox Light (Golos Text + Literata), Catppuccin Mocha (Onest), Tokyo Night (JetBrains Mono); tokens are passed to app frames (`applyThemeTokens`).
- Dashboard “App” widget embeds an installed app with the usual move/resize.
- SDK: media session (`reportMedia`, `onMediaCommand`) and catalog-governed intents between apps (`sendIntent`, `onIntent`).
- Fix: the launcher “Apps” and “Settings” buttons opened the same dialog; distinct icons for Console, desktops and templates.
- Fix: the toast container no longer covers top-right controls; overlays are anchored to the stage, above the global dock.
- Catalog: Delta Media 0.2.0 (player, receives `media.play`/`media.enqueue`) and new source apps Delta YouTube, Delta SoundCloud, Delta Spotify 0.1.0 (send those intents). App CSP allows the official SoundCloud and Spotify embeds.
- The platform limitations below remain unchanged.

## Version 0.1.5

- Pin shared Delta UI 0.3.0 (bcfc44f) automatically (ui-sync).
- One global dock outside every app: Console, installed apps and desktops; configurable position (left/right/top/bottom/hidden), size, labels, order and pinning; context menu (open, pin, rename, duplicate, delete, stop, uninstall); bottom bar on phones.
- “All apps” manager: installed apps appear automatically after installation, catalog install/update, desktop previews and template gallery, dock constructor, theme.
- Apps and desktops are separate concepts; Console and Media are no longer “desktops”. New “Home” desktop with clock, quick launch, now playing and tips.
- Running apps live above the router: music keeps playing when switching apps, desktops or Console pages; mini-player in the dock.
- One global theme for the system and apps: Catppuccin Latte (Manrope), Gruvbox Light (Golos Text + Literata), Catppuccin Mocha (Onest), Tokyo Night (JetBrains Mono); tokens are passed to app frames (`applyThemeTokens`).
- Dashboard “App” widget embeds an installed app with the usual move/resize.
- SDK: media session (`reportMedia`, `onMediaCommand`) and catalog-governed intents between apps (`sendIntent`, `onIntent`).
- Fix: the launcher “Apps” and “Settings” buttons opened the same dialog; distinct icons for Console, desktops and templates.
- Fix: the toast container no longer covers top-right controls; overlays are anchored to the stage, above the global dock.
- Catalog: Delta Media 0.2.0 (player, receives `media.play`/`media.enqueue`) and new source apps Delta YouTube, Delta SoundCloud, Delta Spotify 0.1.0 (send those intents). App CSP allows the official SoundCloud and Spotify embeds.
- The platform limitations below remain unchanged.

## Version 0.1.4

- Pin shared UI 0.2.1, fixing embedded forms and navigation at narrow application-pane widths.
- Restore intended Workbench control styling; preserve saved layouts, identities and Media libraries.
- The platform limitations below remain unchanged.

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
