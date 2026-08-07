{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.noctalia-greeter.nixosModules.default
    inputs.sops-nix.nixosModules.sops
    inputs.spicetify-nix.nixosModules.spicetify

    ./hardware-configuration.nix

    ./modules/core
    ./modules/home
    ./modules/packages
    ./modules/services
  ];
}
