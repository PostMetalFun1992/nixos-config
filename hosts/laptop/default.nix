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

    ../../modules/gpu-intel.nix

    ../../modules/system/common.nix
    ../../modules/virtualization/default.nix
  ];
}
