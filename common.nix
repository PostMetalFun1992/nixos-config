{
  config,
  lib,
  pkgs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

    extraConfig.pipewire."99-input-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = [ 48000 ];
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 1024;
        "default.clock.max-quantum" = 4096;
      };
    };
  };
  security.rtkit.enable = true;

  services.displayManager.ly.enable = true;

  services.libinput.enable = true;

  services.udisks2.enable = true;

  services.xserver = {
    enable = true;

    xkb.layout = "us,ru";
    xkb.variant = "";
    xkb.options = "grp:win_space_toggle";

    windowManager.i3.enable = true;
  };

  programs.river = {
    enable = true;
    xwayland.enable = true;
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

  users.users.postmetalfun1992 = {
    isNormalUser = true;
    description = "PostMetalFun1992";
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "docker"
    ];
    initialPassword = "1";
  };

  home-manager.users.postmetalfun1992 = import ./home/postmetalfun1992.nix;

  system.stateVersion = "25.11";
}
