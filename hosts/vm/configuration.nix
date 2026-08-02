{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "nixos";
  system.stateVersion = "26.05";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # DE
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Programs
  programs.firefox.enable = true;
}
