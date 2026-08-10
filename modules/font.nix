{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      adwaita-fonts
      nerd-fonts.caskaydia-cove
      noto-fonts
      noto-fonts-cjk-sans
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
        "Adwaita Sans"
        "Noto Sans CJK JP"
        "Noto Sans CJK KR"
        "Noto Sans CJK HK"
        "Noto Sans CJK TC"
        "Noto Sans CJK SC"
        "Google Sans"
        "Caskaydia Cove Nerd Font"
      ];
      sansSerif = [
        "Adwaita Sans"
        "Noto Sans CJK JP"
        "Noto Sans CJK KR"
        "Noto Sans CJK HK"
        "Noto Sans CJK TC"
        "Noto Sans CJK SC"
        "Google Sans"
        "Caskaydia Cove Nerd Font"
      ];
      monospace = [
        "Caskaydia Cove Nerd Font"
        "Noto Sans CJK JP"
        "Noto Sans CJK KR"
        "Noto Sans CJK HK"
        "Noto Sans CJK TC"
        "Noto Sans CJK SC"
        "Google Sans"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
