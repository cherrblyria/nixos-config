{ pkgs, ... }:

{
  networking.hostName = "nixos";
  system.stateVersion = "26.11";
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Experimental
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Environment variables
  environment.variables = {
    XCURSOR_THEME = "mizuki-psekai-cursor";
    XCURSOR_SIZE = "24";
    GTK_THEME = "adw-gtk3";

    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    GDK_BACKEND = "wayland,x11,*";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    fish_greeting = "";
  };

  # Secrets
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/var/lib/sops-nix/key.txt";
    secrets."tailscale_key".owner = "cherr";
  };
}
