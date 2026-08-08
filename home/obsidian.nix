{
  programs.obsidian = {
    enable = true;
    cli.enable = true;
  };
  home.file.".config/obsidian/user-flags.conf".source = ../dots/config/obsidian/user-flags.conf;
}
