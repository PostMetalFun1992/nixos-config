{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnupg
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600;
    pinentry.package = pkgs.pinentry-curses;
  };
}
