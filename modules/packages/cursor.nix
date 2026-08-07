{ pkgs, ... }:
let
  myCursorTheme = pkgs.runCommand "my-cursor-theme" { } ''
    mkdir -p $out/share/icons/mizuki-psekai-cursor
    cp -r ${../../assets/cursors/mizuki-psekai-cursor}/* $out/share/icons/mizuki-psekai-cursor/
  '';
in
{
  environment.systemPackages = [ myCursorTheme ];
}
