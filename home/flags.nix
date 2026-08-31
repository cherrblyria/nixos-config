{ config, dots, ... }:
{
  xdg.configFile = {
    "brave-origin-nightly-flags.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/brave-origin-nightly-flags.conf";
    "chrome-flags.conf".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/chrome-flags.conf";
    "chromium-flags.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/chromium-flags.conf";
    "code-flags.conf".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/code-flags.conf";
    "electron-flags.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/electron-flags.conf";
  };
}
