{ config, pkgs, ... }:

let
  stylix-source = builtins.fetchTarball "https://github.com/danth/stylix/archive/release-24.11.tar.gz";
in
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/gpu-intel.nix
    ../../common.nix
    (import stylix-source).nixosModules.stylix
  ];
  stylix = {
    enable = true;
    autoEnable = false;

    image = ../../home/Backgrounds/current.png;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sizes = {
        terminal = 9;
        applications = 12;
        desktop = 11;
        popups = 16;
      };
    };
  };
}
