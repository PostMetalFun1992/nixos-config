{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    helix
  ];

  xdg.configFile."helix".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/helix";
}
