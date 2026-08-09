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
    initialPassword = "1234";
  };
}
