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
    ../../modules/system/sound.nix
    ../../modules/system/fonts.nix
    ../../modules/system/users.nix

    ../../modules/virtualization/default.nix
  ];
}
