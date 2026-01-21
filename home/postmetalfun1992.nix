{ config, lib, pkgs, ... }:

{
  imports = [
    ./terminal/alacritty.nix
    ./terminal/fish.nix
    ./terminal/starship.nix
    ./terminal/git.nix
    ./terminal/scripts.nix
    ./terminal/btop.nix
    ./terminal/helix.nix

    ./gui/i3.nix
    ./gui/i3status-rust.nix
    ./gui/dunst.nix
    ./gui/picom.nix
    ./gui/rofi.nix

    ./security/gpg.nix
  ]
  ++ (lib.optional (builtins.pathExists ./security/ssh.secret.nix) ./security/ssh.secret.nix);

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
    alacritty
    bat
    bluetui
    btop
    claude-code
    eza
    firefox
    glow
    gnupg
    helix
    nb
    pass
    pinentry-curses
    pulsemixer
    tig
    uv
    yazi
    zellij
  ];

  programs.yazi.enable = true;
  programs.yazi.enableFishIntegration = true;
  xdg.configFile."yazi/yazi.toml".source = ./yazi/yazi.toml;

  home.file."Backgrounds".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/Backgrounds";

  programs.zellij.enable = true;
  xdg.configFile."zellij/config.kdl".source = ./zellij/config.kdl;

  home.file.".nbrc".source = ./nb/.nbrc;

  programs.firefox = {
    enable = true;
    
    profiles.postmetalfun1992 = {
      isDefault = true;
    };
  };

  programs.home-manager.enable = true;
}
