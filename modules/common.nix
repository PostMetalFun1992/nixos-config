{
  config,
  lib,
  pkgs,
  ...
}:

{
  system.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = false;
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

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
}
