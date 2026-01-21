{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    picom
  ];

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    shadow = false;
    fade = true;
    fadeDelta = 3;
    fadeSteps = [
      0.08
      0.08
    ];

    opacityRules = [
      "100:class_g = 'Firefox' && argb"
      "100:class_g = 'mpv'"
      "100:class_g = 'vlc'"
      "100:fullscreen"
    ];

    settings = {
      glx-no-stencil = true;
      glx-copy-from-front = false;
      use-damage = true;
      blur-background = false;
      inactive-dim = 0.2;
    };
  };
}
