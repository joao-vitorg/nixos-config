{ config, lib, pkgs, ... }: {
	imports = [
		../modules/desktop/home.nix
		../modules/programs
	];

	programs.home-manager.enable = true;

	home = {
		username = "dallas";
		homeDirectory = "/home/dallas";
		stateVersion = "23.11";
	};
}
