{ pkgs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "backup";

    users.cherr = {
      imports = [
        ../home/fish.nix
        ../home/git.nix
        ../home/kitty.nix
        ../home/nh.nix
        ../home/starship.nix
        ../home/vscode.nix
        ../home/xdg.nix
        ../home/zoxide.nix
      ];
      home.username = "cherr";
      home.homeDirectory = "/home/cherr";
      home.stateVersion = "26.11";

      gtk = {
        enable = true;
        theme = {
          name = "adw-gtk3";
          package = pkgs.adw-gtk3;
        };
        iconTheme = {
          name = "Papirus";
          package = pkgs.papirus-icon-theme;
        };
      };
    };
  };
}
