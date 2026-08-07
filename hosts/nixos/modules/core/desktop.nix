{ pkgs, ... }:
{
  programs.noctalia-greeter = {
    enable = true;
    greeter-args = "";
    settings = {
      cursor = {
        theme = "mizuki-psekai-cursor";
        size = 24;
      };
      keyboard.layout = "us";
    };
  };

  programs.niri.enable = true;

  fonts = {
    packages = with pkgs; [
      adwaita-fonts
      nerd-fonts.caskaydia-cove
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      (pkgs.runCommand "my-custom-fonts" { } ''
        mkdir -p $out/share/fonts/truetype
        cp -r ${../../assets/fonts}/* $out/share/fonts/truetype/
      '')
    ];

    fontconfig.defaultFonts = {
      serif = [
        "Adwaita Sans"
        "Noto Serif CJK JP"
        "Google Sans"
      ];
      sansSerif = [
        "Adwaita Sans"
        "Noto Sans CJK JP"
        "Google Sans"
      ];
      monospace = [
        "Caskaydia Cove Nerd Font"
        "Noto Sans Mono CJK JP"
        "Google Sans"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
