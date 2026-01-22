{
  pkgs,
  config,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    dunst
    libnotify
  ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 360;
        height = 200;
        origin = "top-right";
        offset = "20x20";
        transparency = 0;
        padding = 15;
        horizontal_padding = 15;
        frame_width = 2;
        gap_size = 8;
        separator_height = 2;
        separator_color = lib.mkForce "frame";
        font = lib.mkForce "${config.stylix.fonts.monospace.name} ${toString config.stylix.fonts.sizes.popups}";
        format = "<b>%s</b>\\n%b";
        icon_position = "left";
        max_icon_size = 48;
      };

      urgency_low = {
        timeout = 5;
      };

      urgency_normal = {
        timeout = 10;
      };

      urgency_critical = {
        timeout = 0;
      };
    };
  };

  stylix.targets.dunst.enable = true;
}
