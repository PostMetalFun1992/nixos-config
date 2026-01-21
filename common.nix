{ config, lib, pkgs, ... }:

{
  imports =
    let
      home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz;
    in
    [
      (import "${home-manager}/nixos")
    ];

  nixpkgs.config.allowUnfree = true;
  
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Almaty";
  i18n.defaultLocale = "en_US.UTF-8";
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  services.displayManager.ly.enable = true;

  services.libinput.enable = true;

  services.xserver = {
    enable = true;

    xkb.layout = "us,ru";
    xkb.variant = "";
    xkb.options = "grp:win_space_toggle";

    windowManager.i3.enable = true;
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  
  environment.systemPackages = with pkgs; [
    brightnessctl
    curl
    git
    pciutils
    pulseaudio
    usbutils
    vim
    wget
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
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

  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      features = {
        buildkit = true;
      };
    };
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  security.rtkit.enable = true;

  users.users.postmetalfun1992 = {
    isNormalUser = true;
    description = "PostMetalFun1992";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    initialPassword = "1";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.postmetalfun1992 = import ./home/postmetalfun1992.nix;
  };

  system.stateVersion = "25.11";
}
