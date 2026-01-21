{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "PostMetalFun1992";
      email = "kabanovkirill54@protonmail.com";
    };
  };
}
