{ pkgs, lib, ... }: {
	imports = [
		(import ./hardware-configuration.nix)
		(import ../../modules/services/docker.nix)
		(import ../../modules/services/printer.nix)
	];

	services.fstrim.enable = true;

	environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
#    jetbrains.jdk
    keepassxc
    tdesktop
    git
  ];
}
