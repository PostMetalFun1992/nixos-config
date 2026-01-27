{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    alacritty
  ];

  xdg.configFile."alacritty".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/alacritty";
}
