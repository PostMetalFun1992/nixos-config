{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    helix
  ];

  xdg.configFile."helix/config.toml".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/home/dotfiles/helix/config.toml";
}
