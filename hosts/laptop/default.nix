{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./gpu-intel.nix

    ../../modules/bluetooth.nix
    ../../modules/common.nix
    ../../modules/display-manager.nix
    ../../modules/fonts.nix
    ../../modules/sound.nix
    ../../modules/system-packages.nix
    ../../modules/users.nix
    ../../modules/virtualization.nix
    ../../modules/window-manager.nix
  ];
}
