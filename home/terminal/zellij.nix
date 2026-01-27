{
  pkgs,
  config,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;

    enableFishIntegration = false;

    settings = {
      default_layout = "compact";
      pane_frames = false;
      copy_on_select = true;
    };
  };
}
