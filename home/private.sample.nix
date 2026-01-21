{ pkgs, ... }:

{
  programs.ssh = {
    matchBlocks = {
      "github-account-alias-here" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/your_private_key";
      };
    };
  };
}
