{
  # Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # OpenSSH daemon
  services.openssh.enable = true;

  # Flatpak
  services.flatpak.enable = false;

  security.polkit.enable = true;

  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.dbus.enable = true;

  # X11 I think
  services.xserver.enable = false;
  services.libinput.enable = true;
  services.xserver.xkb.layout = "us,th";

  # Power
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
