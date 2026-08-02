{ config, pkgs, ... }:

{
  # Experimental
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  # Language stuff
  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "C.UTF-8";
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
  networking.wireless.enable = true;
  networking.firewall.enable = false;

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
    wget
    fastfetch
  ];
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.fish.enable = true;

  # X11 I think
  services.xserver.enable = false;
  services.libinput.enable = true;
  services.xserver.xkb.layout = "us,th";

  # DE
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
