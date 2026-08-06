{ inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.cherr = {
      imports = [ ../home/git.nix ];
      home.username = "cherr";
      home.homeDirectory = "/home/cherr";
      home.stateVersion = "26.11";
    };
  };
}
