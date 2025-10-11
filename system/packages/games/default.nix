{ pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./steam.nix
  ];

  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    corectrl.enable = true;
  };

  users.users.dallas.extraGroups = [ "corectrl" ];

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
    goverlay
    mangohud
  ];
}
