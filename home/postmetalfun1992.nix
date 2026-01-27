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
    ./terminal/btop.nix
    ./terminal/helix.nix
    ./terminal/yazi.nix
    ./terminal/zellij.nix
    ./terminal/nb.nix

    ./gui/fuzzel.nix
    ./gui/river.nix
    ./gui/firefox.nix

    ./security/gpg.nix
    ./security/ssh.nix

    ./services/udiskie.nix
  ];

  home.username = "postmetalfun1992";
  home.homeDirectory = "/home/postmetalfun1992";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us,ru";
    XKB_DEFAULT_OPTIONS = "grp:win_space_toggle";

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
    swaybg
  ];

  programs.home-manager.enable = true;
}
