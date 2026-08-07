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
        ../home/fish.nix
        ../home/git.nix
        ../home/kitty.nix
        ../home/nh.nix
        ../home/starship.nix
        ../home/vscode.nix
        ../home/xdg.nix
        ../home/zoxide.nix
        ../home/gtk.nix
      ];
    };
  };
}
