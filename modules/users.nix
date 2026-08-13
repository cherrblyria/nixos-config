{ pkgs, ... }:
{
  users.users."cherr" = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "cherr";
    extraGroups = [
      "networkmanager"
      "wheel"
      "uinput"
    ];
    initialPassword = "superstrongpassword";
  };
  nix.settings.trusted-users = [ "cherr" ];
  security.sudo.extraConfig = "Defaults passwd_timeout=0";
}
