{
  programs.git = {
    enable = true;
    signing = {
      key = "/home/cherr/.ssh/id_ed25519.pub";
      signByDefault = true;
      format = "ssh";
    };
  };
}
