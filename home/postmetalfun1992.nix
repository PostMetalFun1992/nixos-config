{ config, lib, pkgs, ... }:

{
  imports = [
    ./terminal/fish.nix
    ./terminal/starship.nix
    ./terminal/git.nix

    ./gui/i3.nix

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
 
  programs.alacritty.enable = true;
  xdg.configFile."alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;

  programs.helix.enable = true;
  xdg.configFile."helix/config.toml".source = ./helix/config.toml;

  programs.yazi.enable = true;
  programs.yazi.enableFishIntegration = true;
  xdg.configFile."yazi/yazi.toml".source = ./yazi/yazi.toml;

  programs.i3status-rust.enable = true;
  xdg.configFile."i3status-rust/config.toml".source = ./i3status-rust/config.toml;

  services.dunst.enable = true;
  xdg.configFile."dunst/dunstrc".source = ./dunst/dunstrc;

  home.file."Backgrounds".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/Backgrounds";

  home.file.".local/bin/lock.sh" = {
    source = ./scripts/lock/lock.sh; 
    executable = true;
  };

  home.file.".local/bin/bluetooth-toggle.sh" = {
    source = ./scripts/bluetooth-toggle/bluetooth-toggle.sh;
    executable = true;
  };
  
  home.file.".local/bin/fehbg.sh" = {
    source = ./scripts/fehbg/fehbg.sh;
    executable = true;
  };
  
  services.picom.enable = true;
  xdg.configFile."picom/picom.conf".source = ./picom/picom.conf;

  programs.zellij.enable = true;
  xdg.configFile."zellij/config.kdl".source = ./zellij/config.kdl;

  xdg.configFile."rofi/config.rasi".source = ./rofi/config.rasi;

  xdg.configFile."btop/btop.conf".source = ./btop/btop.conf;

  home.file.".nbrc".source = ./nb/.nbrc;

  programs.firefox = {
    enable = true;
    
    profiles.postmetalfun1992 = {
      isDefault = true;
    };
  };

  programs.home-manager.enable = true;
}
