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

    ../../modules/system/common.nix
    ../../modules/system/display-manager.nix
    ../../modules/system/fonts.nix
    ../../modules/system/sound.nix
    ../../modules/system/system-packages.nix
    ../../modules/system/users.nix
    ../../modules/system/window-manager.nix

    ../../modules/virtualization/default.nix
  ];
}
