{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    eza
    glow
    nb
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    NB_AUTO_SYNC = "0";
    NB_GIT_AUTO_COMMIT = "1";

    NB_MARKDOWN_TOOL = "${pkgs.glow}/bin/glow";
    NB_DIRECTORY_TOOL = "${pkgs.eza}/bin/eza";
  };
}
