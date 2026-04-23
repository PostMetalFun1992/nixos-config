{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
  ];

  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/waybar";
}
