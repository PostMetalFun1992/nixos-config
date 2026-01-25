{
  pkgs,
  styling,
  lib,
  ...
}:

let
  tags = [
    "1"
    "2"
    "3"
    "4"
    "5"
  ];
in
{
  xdg.configFile."river/init" = {
    executable = true;
    text = ''
      #!/bin/sh

      ## Wallpaper
      pkill swaybg
      swaybg -i "${styling.wallpaper}" -m fill &

      ## Inputs
      riverctl input * xkb-layout "us,ru"
      riverctl input * xkb-options "grp:win_space_toggle"

      riverctl input * tap enabled

      ## Tiling
      riverctl default-layout rivertile
      rivertile -view-padding 5 -outer-padding 5 &

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

      ## Workspaces
      ${lib.concatMapStringsSep "\n" (
        tag:
        let
          mask = toString ("");
        in
        ''
          # Tag ${tag}
          riverctl map normal Super ${tag} set-focused-tags $((1 << (${tag} - 1)))
          riverctl map normal Super+Shift ${tag} set-view-tags $((1 << (${tag} - 1)))
          riverctl map normal Super+Control ${tag} toggle-focused-tags $((1 << (${tag} - 1)))
        ''
      ) tags}
    '';
  };
}
