{ pkgs, ... }:

{
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

      z = "zellij";

      d = "docker";
      dc = "docker compose";
    };
  };  
}
