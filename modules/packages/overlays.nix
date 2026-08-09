{
  nixpkgs.overlays = [
    (final: prev: {
      mizuki-psekai-cursor = prev.runCommand "mizuki-psekai-cursor" { } ''
        mkdir -p $out/share/icons/mizuki-psekai-cursor
        cp -r ${../assets/cursors/mizuki-psekai-cursor}/* $out/share/icons/mizuki-psekai-cursor/
      '';
    })
  ];
}
