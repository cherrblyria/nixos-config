{ config, dots, ... }:
{
  programs.fastfetch.enable = true;
  xdg.configFile."fastfetch/config.jsonc".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/fastfetch/config.jsonc";
}
