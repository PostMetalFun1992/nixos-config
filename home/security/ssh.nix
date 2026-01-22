{ pkgs, ... }:

{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
      };
    };

    extraConfig = ''
      Include config_local
    '';
  };
}
