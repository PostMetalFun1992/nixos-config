{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    i3status-rust
  ];

  xdg.configFile."i3status-rust".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/i3status-rust";
}
