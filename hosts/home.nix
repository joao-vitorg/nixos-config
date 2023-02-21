{ config, lib, pkgs, ... }: {
	imports = [
		../modules/nvim.nix
		../modules/desktop/gnome/home.nix
	];

	home = {
		username = "dallas";
		homeDirectory = "/home/dallas";
		stateVersion = "22.11";
		packages = with pkgs; [
      tdesktop
		];
	};

	programs = {
		home-manager.enable = true;
		firefox = {
			enable = true;
			package = pkgs.firefox-devedition-bin;
		};
	};
}
