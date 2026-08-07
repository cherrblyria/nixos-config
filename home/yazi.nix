{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  home.file = {
    ".config/yazi/yazi.toml".source = ../dots/config/yazi/yazi.toml;
    ".config/yazi/keymap.toml".source = ../dots/config/yazi/keymap.toml;
    ".config/yazi/theme.toml".source = ../dots/config/yazi/theme.toml;
  };
}
