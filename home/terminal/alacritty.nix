{ pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;
  };

  xdg.configFile."alacritty/alacritty.toml".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/home/dotfiles/alacritty/alacritty.toml";
}
