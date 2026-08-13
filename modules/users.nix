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
  nix.settings.trusted-users = [
    "root"
    "cherr"
  ];
  security.sudo.extraConfig = ''
    Defaults passwd_timeout=0
  '';
}
