{
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    openssh.enable = true;
    dbus.enable = true;

    gvfs.enable = true;
    udisks2.enable = true;

    upower.enable = true;
    power-profiles-daemon.enable = true;
    logind.settings.Login.HandleLidSwitchExternalPower = "ignore";

    libinput.enable = true;
    xserver = {
      enable = false;
      xkb.layout = "us,th";
    };
  };
}
