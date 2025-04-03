{ pkgs, ... }: {
  programs = {
    gamemode.enable = true;
  };

  users.extraGroups.vboxusers.members = [ "dallas" ];
  virtualisation.virtualbox = {
    host = {
      enable = false;
      enableExtensionPack = true;
    };
    guest = {
      enable = false;
      dragAndDrop = true;
    };
  };

  systemd.services.lactd = {
    enable = true;
    description = "Radeon GPU monitor";
    unitConfig.ConditionPathExists = "${pkgs.lact}/bin/lact";
    wantedBy = [ "multi-user.target" ];
    after = [
      "syslog.target"
      "systemd-modules-load.service"
    ];
    serviceConfig = {
      User = "root";
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
  };

  environment.systemPackages = with pkgs; [
    wineWowPackages.waylandFull
    winetricks
    protonup
    mangohud
    lutris
    lact
  ];
}
