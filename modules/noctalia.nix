{
  programs = {
    niri.enable = true;

    noctalia = {
      enable = true;
      recommendedServices = {
        enable = true;
      };
    };

    noctalia-greeter = {
      enable = true;
      greeter-args = "";
      settings = {
        cursor = {
          size = 24;
          theme = "mizuki-psekai-cursor";
        };
        keyboard = {
          layout = "us";
        };
      };
    };
  };
}
