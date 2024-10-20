{ pkgs, ... }: {
  programs = {
    gamemode.enable = true;
    steam.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wineWowPackages.unstable
    winetricks
    mangohud
    protonup
    lutris
  ];
}
