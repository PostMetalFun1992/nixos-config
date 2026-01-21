{ config, pkgs, ... }:

{
  home.sessionPath = [
    "${config.home.homeDirectory}/nixos-config/home/dotfiles/bin/"
  ];
}
