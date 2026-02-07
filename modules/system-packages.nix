{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    cachix
    curl
    devenv
    git
    nixfmt
    pciutils
    pulseaudio
    pulsemixer
    usbutils
    vim
    wget
  ];

  programs.fish.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    gcc
    glib
    gnumake
    icu
    openssl
    pkg-config
    stdenv.cc.cc.lib
    zlib
  ];
}
