{
  config,
  pkgs,
  inputs,
  ...
}:

let
  myCursorTheme = pkgs.runCommand "my-cursor-theme" { } ''
    mkdir -p $out/share/icons/mizuki-psekai-cursor
    cp -r ${./assets/cursors/mizuki-psekai-cursor}/* $out/share/icons/mizuki-psekai-cursor/
  '';
in
{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
    inputs.sops-nix.nixosModules.sops

    ./hardware-configuration.nix

    ./modules/boot.nix
    ./modules/users.nix
    ./modules/locale.nix
    ./modules/syncthing.nix
  ];

  # Secrets management
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    age.keyFile = "/var/lib/sops-nix/key.txt";
    secrets."tailscale_key".owner = "cherr";
  };

  # Tailscale
  services.tailscale = {
    enable = true;
    # authKeyFile = config.sops.secrets."tailscale_key".path;
  };

  # Pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Power
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Install custom local font files system-wide
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      adwaita-fonts
      nerd-fonts.caskaydia-cove

      (pkgs.runCommand "my-custom-fonts" { } ''
        mkdir -p $out/share/fonts/truetype
        cp -r ${./assets/fonts}/* $out/share/fonts/truetype/
      '')
    ];

    fontconfig = {
      defaultFonts = {
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
  };

  # Apply GTK / Pointer defaults system-wide
  environment.variables = {
    XCURSOR_THEME = "mizuki-psekai-cursor";
    XCURSOR_SIZE = "24";
    fish_greeting = "";
  };

  programs.nh = {
    enable = true;
    flake = "/home/cherr/nixos-config";
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite

    wget
    fastfetch
    eza
    fzf
    btop
    duf
    cava
    nixfmt

    kitty
    brave-origin
    obsidian
    vesktop
    spotify
    spicetify-cli
    krita
    opencode-desktop

    nautilus
    nautilus-open-any-terminal
    sushi
    loupe
    engrampa
    showtime
    gnome-text-editor
    xdg-desktop-portal-gnome

    adwaita-icon-theme
    adw-gtk3
    (myCursorTheme)
  ];
  programs.vscode = {
    enable = true;
    defaultEditor = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      vscodevim.vim
      pkief.material-icon-theme
    ];
    enterprisePolicies.TelemetryLevel = "off";
  };
  programs.git.enable = true;
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "
$cmd_duration $directory$git_branch
  $character";

      fill = {
        symbol = " ";
        style = "fg:245";
      };

      character = {
        success_symbol = "[ ](bold fg:blue)";
        error_symbol = "[ ](bold fg:red)";
      };

      package.disabled = true;
      line_break.disabled = false;
      memory_usage.disabled = true;
      time.disabled = true;

      git_branch = {
        style = "bg:cyan";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = " 󰜥 [](bold fg:cyan)[$symbol $branch(:$remote_branch)](fg:black bg:cyan)[ ](bold fg:cyan)";
      };

      git_commit = {
        commit_hash_length = 4;
        tag_symbol = " ";
      };

      git_state = {
        format = "[\($state( $progress_current of $progress_total)\)]($style) ";
        cherry_pick = "[🍒 PICKING](bold red)";
      };

      git_status = {
        conflicted = " 🏳 ";
        ahead = " 🏎💨 ";
        behind = " 😰 ";
        diverged = " 😵 ";
        untracked = " 🤷 ‍";
        stashed = " 📦 ";
        modified = " 📝 ";
        staged = "[++\($count\)](green)";
        renamed = " ✍️ ";
        deleted = " 🗑 ";
      };

      hostname = {
        ssh_only = false;
        format = "[•$hostname](bg:cyan bold fg:black)[](bold fg:cyan)";
        trim_at = ".companyname.com";
        disabled = false;
      };

      username = {
        style_user = "bold bg:cyan fg:black";
        style_root = "red bold";
        format = "[](bold fg:cyan)[$user]($style)";
        disabled = false;
        show_always = true;
      };

      directory = {
        home_symbol = " ";
        read_only = "  ";
        style = "bg:green fg:black";
        truncation_length = 2;
        truncation_symbol = "••/";
        format = "[](bold fg:green)[󰉋 → $path]($style)[](bold fg:green)";
        substitutions = {
          "Desktop" = "  ";
          "Documents" = "  ";
          "Downloads" = "  ";
          "Music" = " 󰎈 ";
          "Pictures" = "  ";
          "Videos" = "  ";
          "GitHub" = " 󰊤 ";
        };
      };

      cmd_duration = {
        min_time = 0;
        format = "[](bold fg:yellow)[󰪢 $duration](bold bg:yellow fg:black)[](bold fg:yellow)";
      };
    };
  };
  programs.fish = {
    enable = true;
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
      cls = "clear && fastfetch";

      # Programs
      f = "fzf";
      ff = "fastfetch";
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
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  services.flatpak.enable = true;
  services.udisks2.enable = true;
  security.polkit.enable = true;
  services.gvfs.enable = true;
  services.dbus.enable = true;

  # X11 I think
  services.xserver.enable = false;
  services.libinput.enable = true;
  services.xserver.xkb.layout = "us,th";

  # Desktop
  programs.noctalia-greeter = {
    enable = true;
    greeter-args = "";
    settings = {
      cursor = {
        theme = "mizuki-psekai-cursor";
        size = 24;
      };
      keyboard = {
        layout = "us";
      };
    };
  };
  programs.niri = {
    enable = true;
    useNautilus = true;
  };
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };

  # Keyd
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

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
