{
  pkgs,
  config,
  lib,
  ...
}:

let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  home.packages = with pkgs; [
    i3status-rust
  ];

  programs.i3status-rust = {
    enable = true;

    bars = {
      default = {
        theme = "native";
        icons = "material-nf";

        settings = {
          theme = {
            theme = "native";

            overrides = {
              idle_bg = colors.base01;
              idle_fg = colors.base05;

              good_bg = colors.base0B;
              good_fg = colors.base00;

              info_bg = colors.base0D;
              info_fg = colors.base00;

              warning_bg = colors.base0A;
              warning_fg = colors.base00;

              critical_bg = colors.base08;
              critical_fg = colors.base00;

              separator = "";
              separator_bg = "auto";
              separator_fg = "auto";
            };
          };
        };

        blocks = [
          {
            block = "keyboard_layout";
            driver = "setxkbmap";
            format = " $layout ";
          }
          {
            block = "custom";
            command = "bluetoothctl show | grep -q 'Powered: yes' && echo '󰂯' || echo '󰂲'";
            interval = "once";
            signal = 1;
            click = [
              {
                button = "left";
                cmd = "bluetooth-toggle";
              }
            ];
          }
          {
            block = "temperature";
            format = " $icon $max ";
            chip = "coretemp-isa-*";
            interval = 10;
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents ";
            warning_mem = 80;
            critical_mem = 95;
            interval = 10;
          }
          {
            block = "disk_space";
            path = "/";
            info_type = "available";
            format = " $icon $available ";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "net";
            format = " $icon $ssid $signal_strength ";
            missing_format = " $icon down ";
            interval = 5;
          }
          {
            block = "sound";
            format = " $icon $volume ";
            show_volume_when_muted = true;
            headphones_indicator = true;
          }
          {
            block = "backlight";
            format = " $icon $brightness ";
          }
          {
            block = "battery";
            format = " $icon $percentage ";
            missing_format = "";
            full_format = " $icon full ";
            charging_format = " $icon $percentage+ ";
          }
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
          }
        ];
      };
    };
  };
}
