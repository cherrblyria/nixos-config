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
      imports = [
        ./fish.nix
        ./git.nix
        ./gtk.nix
        ./kitty.nix
        ./nh.nix
        ./niri.nix
        ./starship.nix
        ./vscode.nix
        ./xdg.nix
        ./zoxide.nix
      ];
    };
  };
}
