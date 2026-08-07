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
    nixfmt
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

    ffmpegthumbnailer
    imagemagick
    webp-pixbuf-loader

    adw-gtk3
    papirus-icon-theme
  ];

  programs.fish.enable = true;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.nh = {
    enable = true;
    flake = "/home/cherr/nixos-config";
  };
}
