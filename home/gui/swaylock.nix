{ pkgs, config, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  home.packages = with pkgs; [
    swaylock-effects
    swayidle
  ];

  xdg.configFile."swaylock".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/swaylock";
}
