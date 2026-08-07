{ lib, ... }:
let
  entries = builtins.readDir ./.;
in
{
  imports =
    with lib;
    map (f: ./. + "/${f}") (
      filter (f: f != "default.nix" && (hasSuffix ".nix" f || entries.${f} == "directory")) (
        builtins.attrNames entries
      )
    );
}
