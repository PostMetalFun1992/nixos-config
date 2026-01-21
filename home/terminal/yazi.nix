{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    yazi
  ];

  xdg.configFile."yazi/yazi.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/dotfiles/yazi/yazi.toml";
}
