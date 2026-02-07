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

    ../../modules/virtualization/default.nix
  ];
}
