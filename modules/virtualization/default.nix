{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;

    daemon.settings = {
      features = {
        buildkit = true;
      };
    };
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
    defaultNetwork.settings.dns_enabled = true;
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    podman-compose
  ];
}
