{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    eza
    fish
  ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza --icons -l --group-directories-first";
      la = "eza --icons -la --group-directories-first";
      tree = "eza --icons --tree";

      cat = "bat";
      top = "btop";

      g = "git";

      d = "docker";
      dc = "docker compose";

      p = "podman";
      pc = "podman-compose";
    };

    functions = {
      nmcli-import-ovpn = {
        body = ''
          if test (count $argv) -eq 0
            echo "Usage: nmcli-import-ovpn <file.ovpn>"
            return 1
          end

          set vpn_file $argv[1]

          nmcli connection import type openvpn file "$vpn_file"

          and nmcli connection modify (basename "$vpn_file" .ovpn) ipv4.never-default true ipv6.never-default true

          echo "ovpn file imported"
        '';
      };
    };
  };
}
