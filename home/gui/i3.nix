{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    i3lock-color
    feh
    maim
  ];

  xsession.windowManager.i3 = {
    enable = true;
    config = lib.mkForce null;
  };

  xdg.configFile."i3/config".source = lib.mkForce (
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/dotfiles/i3/config"
  );
}
