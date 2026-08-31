{ config, dots, ... }:
{
  xdg.configFile = {
    "kritarc".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/kritarc";
    "mimeapps.list".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/mimeapps.list";
    "OpenTabletDriver/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/OpenTabletDriver/settings.json";
  };

  home.file.".local/state/noctalia/settings.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/local/state/noctalia/settings.toml";
}
