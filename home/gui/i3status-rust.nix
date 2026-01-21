{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    i3status-rust
  ];

  programs.i3status-rust = {
    enable = true;
  };
  
  xdg.configFile."i3status-rust/config.toml".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/home/dotfiles/i3status-rust/config.toml";
}
