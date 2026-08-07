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
        ../home/nh.nix
        ../home/starship.nix
        ../home/vscode.nix
        ../home/zoxide.nix
      ];
      home.username = "cherr";
      home.homeDirectory = "/home/cherr";
      home.stateVersion = "26.11";

      gtk = {
        theme.package = pkgs.adw-gtk3;
        iconTheme.package = pkgs.papirus-icon-theme;
        gtk4 = {
          theme.package = pkgs.adw-gtk3;
          iconTheme.package = pkgs.papirus-icon-theme;
        };
      };
    };
  };
}
