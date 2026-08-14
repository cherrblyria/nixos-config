{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      adwaita-fonts
      inter
      nerd-fonts.caskaydia-cove
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      # Install fonts in assets dir
      (pkgs.runCommand "my-fonts" { } ''
        mkdir -p $out/share/fonts/truetype
        cp -r ${../assets/fonts}/* $out/share/fonts/truetype/
      '')
    ];

    # Default fonts fallback
    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Serif Thai"
        "Caskaydia Cove Nerd Font"
      ];
      sansSerif = [
        "Inter"
        "Google Sans"
        "Caskaydia Cove Nerd Font"
      ];
      monospace = [
        "Caskaydia Cove Nerd Font"
        "Chakra Petch"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
