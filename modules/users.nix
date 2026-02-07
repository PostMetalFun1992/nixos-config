{ config, pkgs, ... }:

{
  users.users.postmetalfun1992 = {
    isNormalUser = true;
    description = "PostMetalFun1992";

    shell = pkgs.fish;

    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "docker"
    ];

    initialPassword = "1";
  };

  nix.settings.trusted-users = [
    "root"
    "postmetalfun1992"
  ];
}
