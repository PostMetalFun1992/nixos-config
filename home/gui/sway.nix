{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    config = null;
  };

  xdg.configFile."sway".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/sway";
}
