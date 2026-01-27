{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
  ];

  xdg.configFile."fuzzel".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/fuzzel";
}
