{ config, pkgs, ... }:

{
  # Experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Asia/Bangkok";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "C.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,th";
    variant = "";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."cherr" = {
    isNormalUser = true;
    description = "cherr";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    vim
    neovim
    wget
    fastfetch
  ];
  programs.git.enable = true;

  # Desktop
  services.xserver.enable = false;
  services.libinput.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;
  networking.firewall.enable = false;
}
