{ config, pkgs, ... }:

{
  home.sessionPath = [
    "${config.home.homeDirectory}/nixos-config/home/scripts"
  ];
}
