{ pkgs, ... }:
{
  networking.hostName = "nixos";
  system.stateVersion = "26.11";

  # Overlays
  nixpkgs.config.allowUnfree = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  nix.settings = {
    extra-substituters = [ 
      "https://noctalia.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    extra-trusted-public-keys = [ 
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];


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
