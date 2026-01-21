{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    yazi
  ];

  programs.yazi = {
    enable = true;

    enableFishIntegration = true;

    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
        linemode = "none";
      };
    };
  };

  stylix.targets.yazi.enable = true;
}
