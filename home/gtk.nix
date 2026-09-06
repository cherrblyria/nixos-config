{ pkgs, ... }:
{
  home = {
    # Cursor
    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      name = "mizuki-psekai-cursor";
      package = pkgs.mizuki-psekai-cursor;
      size = 24;
    };
  };

  # GTK
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };
}
