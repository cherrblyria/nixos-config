{
  wayland.windowManager.niri.enable = true;
  xsession.enable = true;
  home.file = {
    ".config/niri/config.kdl".source = ../dots/config/niri/config.kdl;
    ".config/niri/animations.kdl".source = ../dots/config/niri/animations.kdl;
    ".config/niri/general.kdl".source = ../dots/config/niri/general.kdl;
    ".config/niri/input.kdl".source = ../dots/config/niri/input.kdl;
    ".config/niri/keymap.kdl".source = ../dots/config/niri/keymap.kdl;
    ".config/niri/rules.kdl".source = ../dots/config/niri/rules.kdl;
  };
}
