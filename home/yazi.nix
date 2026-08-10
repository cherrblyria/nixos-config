{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile = {
    "yazi/yazi.toml".source = ../dots/config/yazi/yazi.toml;
    "yazi/keymap.toml".source = ../dots/config/yazi/keymap.toml;
    "yazi/theme.toml".source = ../dots/config/yazi/theme.toml;
  };
}
