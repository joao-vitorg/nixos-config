{ config, lib, pkgs, ... }: {
	imports = [
		../modules/desktop/gnome/home.nix
		../modules/nvim.nix
	];

	programs.home-manager.enable = true;

	home = {
		username = "dallas";
		homeDirectory = "/home/dallas";
		stateVersion = "22.11";
		packages = with pkgs; [
      firefox-bin
      tdesktop
		];
	};
}
