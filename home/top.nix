{ config, dots, ... }:
{
  programs = {
    bottom = {
      enable = true;
      settings = {
        flags.temperature_type = "c";
        processes.default_grouped = true;
      };
    };
    btop.enable = true;
  };

  xdg.configFile."btop/btop.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dots}/config/btop/btop.conf";
}
