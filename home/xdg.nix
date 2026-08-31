{
  config,
  pkgs,
  dots,
  ...
}:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [
        "gnome"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
    };
  };
  xdg.configFile."mimeapps.list".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/mimeapps.list";
}
