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
    substituters = [ "https://nix-gaming.cachix.org" ];
    trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];

    experimental-features = [
      "flakes"
      "nix-command"
    ];
  };

  # Enable 32bit for osu!
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
