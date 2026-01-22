{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    rofi
    papirus-icon-theme
  ];

  programs.rofi = {
    enable = true;

    terminal = "${pkgs.alacritty}/bin/alacritty";
    location = "center";

    font = lib.mkForce "${config.stylix.fonts.monospace.name} ${toString config.stylix.fonts.sizes.popups}";

    extraConfig = {
      modi = "drun";
      show-icons = true;
      icon-theme = "Papirus";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
    };
  };

  stylix.targets.rofi.enable = true;
}
