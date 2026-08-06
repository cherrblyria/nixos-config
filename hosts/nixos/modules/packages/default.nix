{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite
    wl-clipboard

    wget
    fastfetch
    eza
    fzf
    btop
    duf
    cava
    nixfmt
    yazi

    kitty
    brave-origin
    obsidian
    vesktop
    krita
    opencode-desktop

    nautilus
    nautilus-open-any-terminal
    sushi
    loupe
    engrampa
    showtime
    gnome-text-editor
    xdg-desktop-portal-gnome

    webp-pixbuf-loader
    ffmpegthumbnailer
    imagemagick

    adwaita-icon-theme
    papirus-icon-theme
    adw-gtk3
  ];

  programs.vscode = {
    enable = true;
    defaultEditor = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      vscodevim.vim
      pkief.material-icon-theme
    ];
    enterprisePolicies.TelemetryLevel = "off";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.nh = {
    enable = true;
    flake = "/home/cherr/nixos-config";
  };
}
