{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 5;
          y = 5;
        };
        title = "Alacritty";
        decorations = "None";
      };

      font = {
        offset = {
          x = 0;
          y = -1;
        };
      };
    };
  };

  stylix.targets.alacritty.enable = true;
}
