{
  # Networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Tailscale
  services.tailscale = {
    enable = true;
    authKeyFile = config.sops.secrets."tailscale_key".path;
  };
}
