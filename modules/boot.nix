{ pkgs, ... }:
{
  networking.hostName = "nixos";
  system.stateVersion = "26.11";
  nixpkgs.config.allowUnfree = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    accept-flake-config = true;
  };

  # Enable 32bit for osu!
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
