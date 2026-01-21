{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];

  programs.firefox = {
    enable = true;

    profiles.postmetalfun1992 = {
      isDefault = true;
    };
  };
}
