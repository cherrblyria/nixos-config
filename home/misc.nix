{ config, dots, ... }:
{
  xdg.configFile = {
    # Krita
    "kritarc".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/kritarc";

    # OTD
    "OpenTabletDriver/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/OpenTabletDriver/settings.json";

    # Chromium/Electron
    "brave-origin-nightly-flags.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/brave-origin-nightly-flags.conf";
    "chrome-flags.conf".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/chrome-flags.conf";
    "chromium-flags.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/chromium-flags.conf";
    "code-flags.conf".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/code-flags.conf";
    "electron-flags.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/electron-flags.conf";
  };

  # Noctalia
  home.file.".local/state/noctalia/settings.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/local/state/noctalia/settings.toml";
}
