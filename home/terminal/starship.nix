{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
  };

  xdg.configFile."starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/starship/starship.toml";
}
