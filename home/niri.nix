{ config, dots, ... }:
{
  wayland.windowManager.niri.enable = true;
  xsession.enable = true;
  xdg.configFile = {
    "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/niri/config.kdl";
    "niri/animations.kdl".source =
      config.lib.file.mkOutOfStoreSymlink "${dots}/config/niri/animations.kdl";
    "niri/general.kdl".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/niri/general.kdl";
    "niri/input.kdl".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/niri/input.kdl";
    "niri/keymap.kdl".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/niri/keymap.kdl";
    "niri/rules.kdl".source = config.lib.file.mkOutOfStoreSymlink "${dots}/config/niri/rules.kdl";
  };
}
