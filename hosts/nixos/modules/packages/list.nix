{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # WM/Shell
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    wl-clipboard
    xwayland-satellite

    # CLI/TUI
    btop
    cava
    duf
    eza
    fetch
    fzf
    wget
    yazi

    # Desktop Apps
    brave-origin
    krita
    obsidian
    opencode-desktop
    vesktop

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
