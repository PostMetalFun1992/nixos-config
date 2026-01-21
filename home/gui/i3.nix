{ pkgs, lib, config, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = lib.mkForce null; 
  };

  home.packages = with pkgs; [
    i3status-rust
    i3lock-color
    dunst
    libnotify
    feh
    maim
    picom
    rofi
  ];

  xdg.configFile."i3/config".source = lib.mkForce (config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/home/dotfiles/i3/config");
}
