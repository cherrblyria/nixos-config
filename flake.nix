{
  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://cherrblyria.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "cherrblyria.cachix.org-1:1tlxt98I/WI6e+PjmU6mBOj2qpLOmB2S4z8U4shx2tc="
    ];
  };

  inputs = {
    # Nix
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Noctalia
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets
    sops-nix.url = "github:Mic92/sops-nix";

    # Spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Gaming
    nix-gaming.url = "github:fufexan/nix-gaming";
    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      mkNixos =
        dots:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs dots; };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.noctalia.nixosModules.default
            inputs.noctalia-greeter.nixosModules.default
            inputs.sops-nix.nixosModules.sops
            inputs.spicetify-nix.nixosModules.spicetify

            ./hardware-configuration.nix
            ./home
            ./modules
          ];
        };
    in
    {
      nixosConfigurations.nixos = mkNixos "/home/cherr/nixos-config/dots";
      nixosConfigurations.ci = mkNixos "${./dots}";
    };
}
