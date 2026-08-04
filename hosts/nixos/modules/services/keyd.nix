{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [
          "*"
          "-0000:0000"
          "-1234:5678"
          "-dec0:5eba"
        ];
        settings = {
          main = {
            capslock = "leftcontrol";
            leftcontrol = "grave";

            leftmeta = "leftalt";
            leftalt = "leftmeta";

            rightalt = "rightalt";
            rightshift = "rightshift";
            rightcontrol = "rightcontrol";

            "leftshift+rightshift" = "capslock";
          };
        };
      };
      externalKeyboard = {
        ids = [ "258a:002a" ];
        settings = {
          main = {
            capslock = "leftcontrol";
            leftcontrol = "grave";

            leftmeta = "leftalt";
            leftalt = "leftmeta";

            rightalt = "rightalt";
            rightshift = "rightshift";
            rightcontrol = "rightcontrol";

            "leftshift+rightshift" = "capslock";

            home = "delete";
            delete = "sysrq";
            pageup = "volumeup";
            pagedown = "volumedown";
          };
        };
      };
    };
  };
}
