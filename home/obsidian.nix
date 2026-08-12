{
  programs.obsidian = {
    enable = true;
    cli.enable = true;
  };
  xdg.configFile."obsidian/user-flags.conf".source = ./dots/config/obsidian/user-flags.conf;
}
