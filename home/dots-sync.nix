{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "dots-sync";
      runtimeInputs = [ pkgs.rsync ];
      text = builtins.readFile ../scripts/dots-sync.sh;
    })
  ];
}
