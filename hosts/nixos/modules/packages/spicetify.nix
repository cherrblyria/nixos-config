{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      autoSkipExplicit
      popupLyrics
      copyToClipboard
    ];
    enabledCustomApps = with spicePkgs.customApps; [
      lyricsPlus
      ncsVisualizer
      marketplace
    ];
    # theme = spicePkgs.themes.sleek;
    # colorScheme = "";
  };
}
