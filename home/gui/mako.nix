{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mako
    libnotify
  ];

  xdg.configFile."mako".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/mako";
}
