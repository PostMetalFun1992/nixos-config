{
  pkgs,
  config,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    zellij
  ];

  xdg.configFile."zellij".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/zellij";
}
