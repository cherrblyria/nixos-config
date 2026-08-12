{ config, ... }:
{
  programs.git = {
    enable = true;
    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
      format = "ssh";
    };
    settings = {
      user = {
        name = "cherrblyria";
        email = "cherrblyria@gmail.com";
      };
    };
  };
}
