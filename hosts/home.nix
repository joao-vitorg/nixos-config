{ config, lib, pkgs, ... }: {
  imports = [
    ../modules/desktop/home.nix
    ../modules/programs
    ../dotfiles
  ];

  programs.home-manager.enable = true;

  home = {
    username = "dallas";
    homeDirectory = "/home/dallas";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "25.05";
  };
}
