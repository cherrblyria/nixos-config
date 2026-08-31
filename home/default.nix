{ lib, ... }:
let
  entries = builtins.readDir ./.;
  homeDirectory = "/home/cherr";
  dots = "${homeDirectory}/nixos-config/dots";
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.cherr = {
      _module.args.dots = dots;
      home = {
        username = "cherr";
        homeDirectory = homeDirectory;
        stateVersion = "26.11";
      };
      imports =
        with lib;
        map (f: ./. + "/${f}") (
          filter (f: f != "default.nix" && hasSuffix ".nix" f) (builtins.attrNames entries)
        );
    };
  };
}
