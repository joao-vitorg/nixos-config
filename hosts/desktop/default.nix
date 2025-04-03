{ pkgs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/services/ssh.nix
  ];
}
