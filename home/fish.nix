{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    functions = {
      yc = ''
        set -l tmp (mktemp -t "yazi-chooser.XXXXXX")
        command yazi $argv --chooser-file="$tmp"
        if test -s "$tmp"
          echo (cat "$tmp")
          rm -f -- "$tmp"
        end
      '';
    };
    shellAliases = {
      # Zoxide
      cd = "z";

      # Eza
      ls = "eza -h  --icons --group-directories-first";
      la = "ls -A";
      l = "ls -lA";
      ll = "ls -l";
      lls = "ls -lA --total-size";
      lt = "ls -T";
      lat = "ls -TA";

      # Shortcuts
      c = "clear";
      cls = "clear";

      # Programs
      f = "fzf";
      g = "git";

      # File management
      b = "bat -Pp";
      cp = "cp -i";
      mk = "touch";
      mkd = "mkdir";
      mkdir = "mkdir -pv";
      mv = "mv -i";
      rm = "rm -i";
      tch = "touch";

      grep = "grep --color=auto";
      rg = "rg --color=always";
    };
    shellAbbrs = {
      def = "find . -type f -empty -delete";
      ded = "find . -type d -empty -delete";
      dbl = "find . -xtype l -delete";

      fef = "find . -type f -empty";
      fed = "find . -type d -empty";
      fbl = "find . -xtype l";
    };
  };
}
