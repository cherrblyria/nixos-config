{
  wayland.windowManager.niri.enable = true;
  xsession.enable = true;
  xdg.configFile = {
    "niri/config.kdl".source = ../dots/config/niri/config.kdl;
    "niri/animations.kdl".source = ../dots/config/niri/animations.kdl;
    "niri/general.kdl".source = ../dots/config/niri/general.kdl;
    "niri/input.kdl".source = ../dots/config/niri/input.kdl;
    "niri/keymap.kdl".source = ../dots/config/niri/keymap.kdl;
    "niri/rules.kdl".source = ../dots/config/niri/rules.kdl;
  };
}
