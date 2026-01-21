{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    picom
  ];

  services.picom = {
    enable = true;
  };

  xdg.configFile."picom/picom.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/dotfiles/picom/picom.conf";
}
