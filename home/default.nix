{ config, lib, pkgs, ... }: {
  imports = [
    ./configs
    ./packages
  ];

  programs.home-manager.enable = true;

  home = {
    username = "dallas";
    homeDirectory = "/home/dallas";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "25.05";
  };
}
