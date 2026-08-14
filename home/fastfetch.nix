{
  programs.fastfetch = {
    enable = true;
    settings = {
      "logo" = {
        # "type" = "file";
        # "source" = "${../assets/arts/herta.txt}";
        "type" = "kitty-direct";
        "source" = "${../assets/images/herta_3.png}";
        "width" = 30;
        "padding" = {
          "left" = 0;
          "top" = 0;
          "right" = 0;
          "bottom" = 0;
        };
      };
      "display"."separator" = "";
      "modules" = [
        "break"
        {
          "key" = "{##d52d00} user  {#keys}";
          "type" = "title";
          "format" = "{user-name}";
        }
        {
          "key" = "{##e55c18}󰇅 hname {#keys}";
          "type" = "title";
          "format" = "{host-name}";
        }
        {
          "key" = "{##f27e31}{icon} dist  {#keys}";
          "type" = "os";
        }
        {
          "key" = "{##fc934d} ker   {#keys}";
          "type" = "kernel";
        }
        {
          "key" = "{##ffc198}󰇄 wm    {#keys}";
          "type" = "wm";
          "format" = "{1}";
        }
        {
          "key" = "{##ffffff} term  {#keys}";
          "type" = "terminal";
        }
        {
          "key" = "{##e7a2c8} sh    {#keys}";
          "type" = "shell";
        }
        {
          "key" = "{##cb60a0}󰍛 cpu   {#keys}";
          "format" = "{}";
          "type" = "cpu";
          "showPeCoreCount" = true;
        }
        {
          "key" = "{##bb5893}󰉉 disk  {#keys}";
          "format" = "{1} / {2} ({3})";
          "type" = "disk";
          "folders" = "/";
        }
        {
          "key" = "{##af3e7c} mem   {#keys}";
          "type" = "memory";
        }
        {
          "key" = "{##a30263}󰅐 up    {#keys}";
          "type" = "uptime";
        }
      ];
    };
  };
}
