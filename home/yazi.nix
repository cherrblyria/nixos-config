{ config, dots, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile = {
    "yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/yazi/yazi.toml";
    "yazi/keymap.toml".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/yazi/keymap.toml";
    "yazi/theme.toml".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/yazi/theme.toml";
  };
}
