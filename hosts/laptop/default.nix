{ pkgs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/development
    ../../modules/programs/steam.nix
  ];

  services = {
    xserver.videoDrivers = ["amdgpu"];
    fstrim.enable = true;
  };

  environment.systemPackages = with pkgs; [
    transmission_4-gtk
    qalculate-gtk
    keepassxc
    chromium
    ntfs3g
    gimp
  ];
}
