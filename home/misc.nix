{ config, dots, ... }:
{
  # Krita
  xdg.configFile."kritarc".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/kritarc";

  # OTD
  xdg.configFile."OpenTabletDriver/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/OpenTabletDriver/settings.json";

  # Chromium/Electron
  xdg.configFile."brave-origin-nightly-flags.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/brave-origin-nightly-flags.conf";
  xdg.configFile."chrome-flags.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/chrome-flags.conf";
  xdg.configFile."chromium-flags.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/chromium-flags.conf";
  xdg.configFile."code-flags.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/code-flags.conf";
  xdg.configFile."electron-flags.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/electron-flags.conf";

  # Noctalia
  home.file.".local/state/noctalia/settings.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/local/state/noctalia/settings.toml";
}
