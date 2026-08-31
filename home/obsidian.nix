{ config, dots, ... }:
{
  programs.obsidian = {
    enable = true;
    cli.enable = true;
  };
  xdg.configFile."obsidian/user-flags.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/obsidian/user-flags.conf";
}
