{ pkgs, ... }:
{
  users.users."cherr" = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Cherrblyria";
    extraGroups = [
      "networkmanager"
      "wheel"
      "uinput"
    ];
    initialPassword = "superstrongpassword";
  };

  security.sudo.extraConfig = ''
    Defaults passwd_timeout=0
  '';
nix.settings.trusted-users = [ "root" "cherr" ];
}
