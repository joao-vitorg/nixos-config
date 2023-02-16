{ config, lib, pkgs, ... }: {
	imports = [ ../modules/nvim.nix ];

	home = {
		username = "dallas";
		homeDirectory = "/home/dallas";
		stateVersion = "22.11";
    pointerCursor = {
      gtk.enable = true;
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
      size = 16;
    };
		packages = with pkgs; [
      tdesktop
		];
	};

  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

	programs = {
		home-manager.enable = true;
		firefox = {
			enable = true;
			package = pkgs.firefox-devedition-bin;
		};
	};
}
