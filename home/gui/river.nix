{ pkgs, styling, ... }:

{
  xdg.configFile."river/init" = {
    executable = true;
    text = ''
      #!/bin/sh

      ## Tiling generator
      riverctl default-layout rivertile
      rivertile -view-padding ${toString styling.windowManager.paddings.inner} \
                -outer-padding ${toString styling.windowManager.paddings.outer} &

      ## Input
      riverctl input-config-type touchpad tap enabled

      ## Keybindings

      # Open app menu
      riverctl map normal Super D spawn fuzzel

      # Open terminal
      riverctl map normal Super Return spawn alacritty

      # Close window
      riverctl map normal Super Q close

      # Exit
      riverctl map normal Super+Shift E exit
    '';
  };
}
