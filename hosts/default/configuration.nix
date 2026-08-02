{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.noctalia-greeter.nixosModules.default
  ];

  networking.hostName = "nixos";
  system.stateVersion = "26.11";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Experimental
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  # Language stuff
  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "C.UTF-8";

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

  # Syncthings
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  # Tailscale
  services.tailscale.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."cherr" = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "cherr";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite

    wget
    fastfetch
    eza
    btop
    duf
    cava

    kitty
    alacritty
    brave-origin
    obsidian
    vesktop
    spotify
    spicetify-cli
    krita

    nautilus
    nautilus-open-any-terminal
    sushi
    loupe
    engrampa
    showtime
    gnome-text-editor
    xdg-desktop-portal-gnome

    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.caskaydia-cove
  ];

  programs.git.enable = true;
  programs.vscode = {
    enable = true;
    defaultEditor = true;
    enterprisePolicies."TelemetryLevel" = "off";
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = "";
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
        # theme = "Bibata-Modern-Ice";
        # size = 24;
        # path = "${pkgs.bibata-cursors}/share/icons";
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
          externalKeyboard = {
            ids = [ "258a:002a" ];
            settings = {
              main = {
                home = "delete";
                delete = "sysrq";
                pageup = "volumeup";
                pagedown = "volumedown";
              };
            };
          };
        };
      };
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
