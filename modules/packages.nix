{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # WM/Shell
    wl-clipboard
    mizuki-psekai-cursor

    # CLI/TUI
    eza
    fd
    fzf
    imagemagick
    lazygit
    ripgrep
    wget

    # Desktop Apps
    brave-origin
    czkawka
    krita
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
    (inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default)

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
  programs.fish.enable = true;
}
