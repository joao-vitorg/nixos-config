{ pkgs, ... }: {
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    corectrl.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
    mangohud
    lutris
  ];
}
