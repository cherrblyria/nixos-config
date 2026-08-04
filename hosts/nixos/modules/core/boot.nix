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

    fish_greeting = "";
  };

  # Secrets
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/var/lib/sops-nix/key.txt";
    secrets."tailscale_key".owner = "cherr";
  };
}
