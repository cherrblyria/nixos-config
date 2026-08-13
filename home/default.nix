{ lib, ... }:
let
  entries = builtins.readDir ./.;
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.cherr = {
      home = {
        username = "cherr";
        homeDirectory = "/home/cherr";
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
