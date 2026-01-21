{ pkgs, ... }:

{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "github-account-alias" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_for_secret_key";
      };
    };
  };
}
