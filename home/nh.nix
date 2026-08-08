{
  programs.nh = {
    enable = true;
    flake = "/home/cherr/nixos-config";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
