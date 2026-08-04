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
}
