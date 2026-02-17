{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    (brave.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        rm $out/share/applications/com.brave.Browser.desktop
      '';
    }))
  ];
}
