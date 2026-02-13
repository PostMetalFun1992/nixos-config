{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      sway = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.Screencast" = [ "wlr" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      };

      common = {
        default = [ "gtk" ];
      };
    };
  };
}
