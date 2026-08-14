{ config, pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "dots-sync";
      runtimeInputs = [ pkgs.rsync ];
      text = ''
        #!/usr/bin/env bash

        set -euo pipefail

        REPO_DOTS="${config.home.homeDirectory}/nixos-config/home/dots"

        # paths relative to $HOME (files or directories, both work)
        paths=(
          ".local/state/noctalia/settings.toml"
          ".config/kritarc"
          ".config/mimeapps.list"
          ".config/OpenTabletDriver/settings.json"
        )

        sync_dir_or_file() {
          local src="$1" dst="$2"
          mkdir -p "$(dirname "$dst")"
          if [[ -d "$src" ]]; then
            mkdir -p "$dst"
            rsync -a --delete "$src"/ "$dst"/
          else
            rsync -a "$src" "$dst"
          fi
        }

        for rel in "''${paths[@]}"; do
          target="${config.home.homeDirectory}/$rel"
          repo="$REPO_DOTS/''${rel#.}"

          if [[ -e "$target" ]]; then
            sync_dir_or_file "$target" "$repo"
            echo "[backup] $rel"
          elif [[ -e "$repo" ]]; then
            sync_dir_or_file "$repo" "$target"
            echo "[deploy] $rel"
          else
            echo "[skip]   $rel (missing on both sides)"
          fi
        done
      '';
    })
  ];
}
