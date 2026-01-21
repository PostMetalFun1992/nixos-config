{ pkgs, config, ... }:

{
  xdg.configFile."rofi/config.rasi".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/home/dotfiles/rofi/config.rasi";
}
