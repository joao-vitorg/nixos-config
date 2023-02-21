{ pkgs, lib, ... }: {
	imports = [
		(import ./hardware-configuration.nix)
		(import ../../modules/docker.nix)
	];

	services.fstrim.enable = true;
}
