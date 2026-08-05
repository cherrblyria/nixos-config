{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    wayland = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      autoSkipExplicit
      copyToClipboard
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      ncsVisualizer
      marketplace
    ];
    # theme = spicePkgs.themes.sleek;
    # colorScheme = "";
  };
}
