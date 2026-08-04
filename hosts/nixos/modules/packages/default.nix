{ pkgs, inputs, ... }:

let
  myCursorTheme = pkgs.runCommand "my-cursor-theme" { } ''
    mkdir -p $out/share/icons/mizuki-psekai-cursor
    cp -r ${../../assets/cursors/mizuki-psekai-cursor}/* $out/share/icons/mizuki-psekai-cursor/
  '';
in
{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite

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
    spotify
    spicetify-cli
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

    adwaita-icon-theme
    adw-gtk3
    (myCursorTheme)
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

  programs.git = {
    enable = true;
    signing = {
      key = "/home/cherr/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      gpg.format = "ssh";
    };
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
