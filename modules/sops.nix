{ config, ... }:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "/var/lib/sops-nix/key.txt";
    secrets = {
      "tailscale_key".owner = "cherr";
      "wallhaven_api_key".owner = "cherr";
    };

    templates."noctalia_wallhaven.toml" = {
      owner = "cherr";
      path = "${config.users.users.cherr.home}/.config/noctalia/config.toml";
      content = ''
        [plugin_settings."noctalia/wallhaven"]
        api_key = "${config.sops.placeholder.wallhaven_api_key}"
      '';
    };
  };
}
