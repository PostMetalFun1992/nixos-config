{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    helix
  ];

  programs.helix = {
    enable = true;

    settings = {
      editor = {
        line-number = "relative";
        mouse = false;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
          character = "|";
        };
      };
    };
  };

  stylix.targets.helix.enable = true;
}
