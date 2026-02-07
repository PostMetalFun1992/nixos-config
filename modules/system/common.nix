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

  services.libinput.enable = true;

  services.udisks2.enable = true;

  programs.fish.enable = true;

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  home-manager.users.postmetalfun1992 = import ../../home/postmetalfun1992.nix;

  system.stateVersion = "25.11";
}
