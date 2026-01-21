{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    btop
  ];

  xdg.configFile."btop/btop.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/dotfiles/btop/btop.conf";
}
