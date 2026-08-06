{ pkgs, inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.cherr = {
      imports = [
        ../home/git.nix
        ../home/fish.nix
        ../home/starship.nix
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
