{ pkgs, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "backup";

    users.cherr = {
      imports = [
        ../home/fish.nix
        ../home/git.nix
        ../home/starship.nix
        ../home/vscode.nix
      ];
      home.username = "cherr";
      home.homeDirectory = "/home/cherr";
      home.stateVersion = "26.11";

      gtk.theme = "adw-gtk3";
      gtk.gtk4.theme = "adw-gtk3";
      gtk.iconTheme = "Papirus";
    };
  };
}
