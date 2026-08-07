{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    wl-clipboard
    xwayland-satellite

    btop
    cava
    duf
    eza
    fetch
    fzf
    wget
    yazi

    brave-origin
    kitty
    krita
    obsidian
    opencode-desktop
    vesktop

    engrampa
    gnome-text-editor
    loupe
    nautilus
    nautilus-open-any-terminal
    showtime
    sushi
    xdg-desktop-portal-gnome

    nixfmt
    nixd

    ffmpegthumbnailer
    imagemagick
    webp-pixbuf-loader

    adw-gtk3
  ];

  programs.fish.enable = true;
}
