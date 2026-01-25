{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./terminal/alacritty.nix
    ./terminal/fish.nix
    ./terminal/starship.nix
    ./terminal/git.nix
    ./terminal/scripts.nix
    ./terminal/btop.nix
    ./terminal/helix.nix
    ./terminal/yazi.nix
    ./terminal/zellij.nix
    ./terminal/nb.nix

    ./gui/i3.nix
    ./gui/i3status-rust.nix
    ./gui/dunst.nix
    ./gui/picom.nix
    ./gui/rofi.nix
    ./gui/firefox.nix

    ./security/gpg.nix
    ./security/ssh.nix

    ./services/udiskie.nix
  ];

  home.username = "postmetalfun1992";
  home.homeDirectory = "/home/postmetalfun1992";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    TERMINAL = "alacritty";

    EDITOR = "hx";
    VISUAL = "hx";
    MANPAGER = "hx";

    DOCKER_BUILDKIT = "1";
    COMPOSE_DOCKER_CLI_BUILD = "1";
  };

  home.packages = with pkgs; [
    bluetui
    fuzzel
    docker-compose
    pass
    pkgs.nixfmt
    pinentry-curses
    pulsemixer
  ];

  xdg.configFile."river/init" = {
    executable = true;
    text = ''
      #!/bin/sh

      rivertile -view-padding 5 -outer-padding 5 &
      riverctl default-layout rivertile
      riverctl input-config-type touchpad tap enabled

      riverctl map normal Super D spawn fuzzel

      riverctl map normal Super Return spawn alacritty
      riverctl map normal Super Q close
      riverctl map normal Super+Shift E exit
    '';
  };

  xdg.configFile."fuzzel/fuzzel.ini".text = ''
    [main]
    font=JetBrains Mono:size=14
    prompt="> "
    layer=overlay
    width=40

    [colors]
    background=282828ff
    text=ebdbb2ff
    match=d79921ff
    selection=3c3836ff
    selection-text=ebdbb2ff
    border=d79921ff
  '';

  home.file."Backgrounds".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/Backgrounds";

  programs.home-manager.enable = true;
}
