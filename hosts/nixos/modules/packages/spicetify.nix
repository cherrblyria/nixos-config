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
      autoSkipExplicit
      copyToClipboard
      hidePodcasts
      shuffle
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      marketplace
      ncsVisualizer
    ];
    # theme = "marketplace";
    # colorScheme = "";
  };
}
