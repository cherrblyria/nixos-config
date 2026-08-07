{ pkgs, ... }:
{
  networking.hostName = "nixos";
  system.stateVersion = "26.11";
  nixpkgs.config.allowUnfree = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
  };

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];
}
