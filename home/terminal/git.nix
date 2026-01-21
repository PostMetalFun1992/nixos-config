{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    tig
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "PostMetalFun1992";
      email = "kabanovkirill54@protonmail.com";
    };
  };
}
