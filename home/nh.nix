{ config, ... }:
{
  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/nixos-config";
    clean = {
      enable = true;
      dates = "saturday";
      extraArgs = "--keep 10 --keep-since 7d";
    };
  };
}
