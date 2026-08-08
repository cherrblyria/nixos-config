{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # WM/Shell
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    wl-clipboard
    mizuki-psekai-cursor

    # CLI/TUI
    btop
    duf
    eza
    fetch
    fzf
    wget

    # Desktop Apps
    brave-origin
    krita
    obsidian
    opencode-desktop
    vesktop

    # Games
    (inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable.override {
      tricks = [
        "gdiplus"
        "dotnet48"
        "meiryo"
      ];
      useGameMode = false;
    })

    # Gnome-ish
    engrampa
    gnome-text-editor
    loupe
    nautilus
    showtime
    sushi

    # NIX
    nixfmt
    nixd

    # Deps
    ffmpegthumbnailer
    imagemagick
    webp-pixbuf-loader
  ];
  programs.fish.enable = true;
  programs.niri.enable = true;
}
