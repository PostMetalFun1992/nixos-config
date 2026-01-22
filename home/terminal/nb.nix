{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    eza
    glow
    nb
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    NB_AUTO_SYNC = "0";
    NB_GIT_AUTO_COMMIT = "1";

    NB_MARKDOWN_TOOL = "${pkgs.glow}/bin/glow";
    NB_DIRECTORY_TOOL = "${pkgs.eza}/bin/eza";
  };

  # Check: systemctl --user list-timers --all | grep nb
  # Logs: journalctl --user -u nb-sync -n 20
  systemd.user.services.nb-sync = {
    Unit = {
      Description = "Auto sync nb notes";
      After = [ "network.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.nb}/bin/nb sync";
      Nice = 19; # Let the other process go forward
    };
  };

  systemd.user.timers.nb-sync = {
    Unit = {
      Description = "Timer for nb auto sync";
    };
    Timer = {
      Unit = "nb-sync.service";
      OnStartupSec = "10s";
      OnUnitActiveSec = "5m";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
