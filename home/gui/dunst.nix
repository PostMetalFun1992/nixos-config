{ pkgs, config, ... }:

{
  services.dunst = {
    enable = true;
  };

  xdg.configFile."dunst/dunstrc".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/home/dotfiles/dunst/dunstrc";
}
