{ pkgs, config, ... }:

{
  xdg.configFile."zellij/config.kdl".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/home/dotfiles/zellij/config.kdl";
}
