{ pkgs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/development
    ../../modules/programs/lutris.nix
    ../../modules/services/kanata.nix
  ];

  services = {
    xserver.videoDrivers = [ "amdgpu" ];
    fstrim.enable = true;
  };

  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  };

  nixpkgs.config.rocmSupport = true;

  environment.systemPackages = with pkgs; [
    transmission_4-gtk
    qalculate-gtk
    keepassxc
    chromium
    jackett
    vlc
  ];
}
