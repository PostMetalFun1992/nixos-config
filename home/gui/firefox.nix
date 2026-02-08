{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];

  programs.firefox = {
    enable = true;

    profiles = {

      postmetalfun1992 = {
        id = 0;
        name = "postmetalfun1992";
        isDefault = true;
        path = "postmetalfun1992";
      };

      developer = {
        id = 1;
        name = "developer";
        isDefault = false;
        path = "developer";
      };
    };
  };

  xdg.desktopEntries = {
    firefox-developer-profile = {
      name = "Firefox Developer Profile";
      genericName = "Firefox for dev";
      comment = "Separate profile for Develop & Security research";

      exec = "firefox -P developer --no-remote";

      terminal = false;
      categories = [
        "Application"
        "Network"
        "WebBrowser"
      ];

      icon = "firefox";
    };
  };
}
