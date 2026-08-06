{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.noctalia-greeter.nixosModules.default
    inputs.sops-nix.nixosModules.sops
    inputs.spicetify-nix.nixosModules.spicetify

    ./hardware-configuration.nix

    ./modules/core/boot.nix
    ./modules/core/desktop.nix
    ./modules/core/home.nix
    ./modules/core/locale.nix
    ./modules/core/network.nix
    ./modules/core/users.nix

    ./modules/packages/cursor.nix
    ./modules/packages/default.nix
    ./modules/packages/spicetify.nix

    ./modules/services/keyd.nix
    ./modules/services/misc.nix
    ./modules/services/syncthing.nix
  ];
}
