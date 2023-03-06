{ config, lib, pkgs, ... }: {
	imports = [
		../modules/desktop/home.nix
		../modules/programs/nvim.nix
	];

	programs.home-manager.enable = true;

	home = {
		username = "dallas";
		homeDirectory = "/home/dallas";
		stateVersion = "22.11";
	};
}
