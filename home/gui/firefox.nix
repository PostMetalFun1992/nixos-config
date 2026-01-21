{ pkgs, config, ... }:

{
  programs.firefox = {
    enable = true;
    
    profiles.postmetalfun1992 = {
      isDefault = true;
    };
  };
}
