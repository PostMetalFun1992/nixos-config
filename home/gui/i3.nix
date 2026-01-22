{
  pkgs,
  config,
  lib,
  ...
}:

let
  mod = "Mod4";
in
{
  home.packages = with pkgs; [
    feh
    i3lock-color
    maim
    xclip
    brightnessctl
    xss-lock
  ];

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;

      window = {
        border = 0;
        titlebar = false;
      };

      floating = {
        border = 0;
      };

      gaps = {
        inner = 5;
        outer = 0;
      };

      workspaceAutoBackAndForth = false;

      bars = [
        {
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${config.xdg.configHome}/i3status-rust/config-default.toml";
          trayOutput = "primary";

          fonts = {
            names = [ config.stylix.fonts.monospace.name ];
            size = config.stylix.fonts.sizes.desktop * 1.0;
          };

          colors = {
            background = "${config.lib.stylix.colors.withHashtag.base00}";
            statusline = "${config.lib.stylix.colors.withHashtag.base05}";
            separator = "${config.lib.stylix.colors.withHashtag.base00}";
          };
        }
      ];

      startup = [
        {
          command = "${pkgs.i3}/bin/i3-msg workspace 1";
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-fill ${config.stylix.image}";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.xorg.setxkbmap}/bin/setxkbmap -layout 'us,ru' -option 'grp:win_space_toggle'";
          notification = false;
        }
        {
          command = "${pkgs.xss-lock}/bin/xss-lock --transfer-sleep-lock -- lock";
          notification = false;
        }
      ];

      keybindings = lib.mkOptionDefault {
        "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${mod}+Shift+q" = "kill";
        "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun -show-icons";
        "${mod}+Shift+o" = "exec lock";

        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";

        "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set +5%";

        "${mod}+Ctrl+s" = "exec --no-startup-id maim -s | xclip -selection clipboard -t image/png";
        "${mod}+Ctrl+f" = "exec --no-startup-id maim | xclip -selection clipboard -t image/png";
        "${mod}+Ctrl+p" = "exec --no-startup-id maim -s ~/Pictures/screenshot-$(date +%s).png";

        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";

        "${mod}+Shift+j" = "move left";
        "${mod}+Shift+k" = "move down";
        "${mod}+Shift+l" = "move up";
        "${mod}+Shift+semicolon" = "move right";

        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";

        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        "${mod}+h" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";

        "${mod}+a" = "focus parent";

        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        "${mod}+Shift+p" = "exec i3-nagbar -t warning -m 'Exit i3?' -B 'Yes' 'i3-msg exit'";
      };

      modes = {
        resize = {
          "j" = "resize shrink width 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "l" = "resize shrink height 10 px or 10 ppt";
          "semicolon" = "resize grow width 10 px or 10 ppt";

          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";

          "Return" = "mode default";
          "Escape" = "mode default";
          "${mod}+r" = "mode default";
        };
      };
    };
  };

  stylix.targets.i3.enable = true;
}
