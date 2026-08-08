{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "mizuki-psekai-cursor";
    package = pkgs.mizukiCursor;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
}
