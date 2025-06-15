{ pkgs, ... }: {
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
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

  environment.etc."lact/config.yaml".source = "/media/codes/nixos-config/dotfiles2/lact/config.yaml";

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    corectrl
    winetricks
    protonup
    mangohud
    lutris
    lact
  ];
}
