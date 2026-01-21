{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    eza
    glow
    nb
  ];

  home.file.".nbrc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/dotfiles/nb/.nbrc";
}
