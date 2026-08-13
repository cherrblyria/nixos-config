{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # WM/Shell
    wl-clipboard
    mizuki-psekai-cursor

    # CLI/TUI
    btop
    duf
    eza
    fd
    fetch
    fzf
    imagemagick
    ripgrep
    wget
    lazygit

    # Desktop Apps
    brave-origin
    krita
    opencode-desktop
    vesktop
    czkawka

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
    ffmpeg
    ffmpegthumbnailer
    poppler
    resvg
    webp-pixbuf-loader
  ];
  programs = {
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
    fish.enable = true;
    niri.enable = true;
  };
}
