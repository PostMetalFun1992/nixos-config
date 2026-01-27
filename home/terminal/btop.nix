{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    btop
  ];

  xdg.configFile."btop".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/btop";
}
