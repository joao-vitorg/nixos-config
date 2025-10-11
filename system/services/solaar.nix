{ pkgs, ... }: {
  users.users.dallas.extraGroups = [ "uinput" ];

  hardware.logitech.wireless = {
    enableGraphical = true;
    enable = true;
  };

  systemd.user.services.solaar = {
    enable = true;
    description = "Solaar, the open source driver for Logitech devices";
    wantedBy = [ "graphical-session.target" ];
    after = [ "dbus.service" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.solaar}/bin/solaar -w hide";
      Restart = "on-failure";
      RestartSec = "5";
    };
  };
}
