{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    eza
    glow
    nb
  ];

  home.file.".nbrc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/configs/nb/.nbrc";

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
