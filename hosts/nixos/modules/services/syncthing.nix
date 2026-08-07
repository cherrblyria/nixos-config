{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "cherr";
    group = "users";
    dataDir = "/home/cherr";
    settings = {
      gui.user = "cherr";
      devices = {
        "Phone".id = "O76SLWB-LZJFWNX-XY3CRJV-SG7PIMM-P3HNDPU-XZYU7HR-736KX5Q-QGZ45QV";
        "Tablet".id = "7ZYRPOK-AJENNVR-JJFQG2A-NKX4HPY-MJNQQMU-3ADI5DV-DBIMFAY-ARZ3GAT";
      };
      folders = {
        "vault" = {
          id = "vault";
          label = "Cherr's Sanctuary";
          path = "/home/cherr/Documents/Cherr's Sanctuary";
          ignorePatterns = [
            ".git/"
            ".git"
            ".gitignore"
            ".obsidian/community-plugins.json"
          ];
          devices = [
            "Phone"
            "Tablet"
          ];
        };
        "shared-dcim" = {
          id = "shared-dcim";
          label = "DCIM";
          path = "/home/cherr/DCIM";
          devices = [
            "Phone"
            "Tablet"
          ];
        };
        "shared-pics" = {
          id = "shared-pics";
          label = "Pictures";
          path = "/home/cherr/Pictures";
          devices = [
            "Phone"
            "Tablet"
          ];
        };
      };
    };
  };
}
