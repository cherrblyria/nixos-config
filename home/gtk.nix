{ pkgs, lib, ... }:
{
  home = {
    # Papirus Icons
    activation.installPapirus = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d "$HOME/.local/share/icons/Papirus" ]; then
        run cp -r ${pkgs.papirus-icon-theme}/share/icons/Papirus* $HOME/.local/share/icons/
        run chmod -R u+w $HOME/.local/share/icons/Papirus*
      fi
    '';

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
    iconTheme.name = "Papirus";
  };
}
