{ config, ... }:
{
  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/nixos-config";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
