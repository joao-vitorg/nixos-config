{ pkgs, ... }: {
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
		cursorTheme = {
			name = "Dracula-cursors";
			package = pkgs.dracula-theme;
		};
	};

	dconf.settings = {
#    "org/gnome/desktop/interface" = {
#      color-scheme = "prefer-dark";
#      icon-theme = "Papirus-Dark";
#      cursor-theme = "Dracula-cursors";
#    };
		"org/gnome/shell" = {
#			disable-user-extensions = false;
#			favorite-apps = [
#				"firefox.desktop"
#				"idea-ultimate.desktop"
#				"org.gnome.Nautilus.desktop"
#				"org.gnome.Console.desktop"
#				"qalculate-gtk.desktop"
#				"org.keepassxc.KeePassXC.desktop"
#				"org.telegram.desktop.desktop"
#			];
			enabled-extensions = [
				"appindicatorsupport@rgcjonas.gmail.com"
				"clipboard-indicator@tudmotu.com"
			];
		};
	};

	home.packages = with pkgs.gnomeExtensions; [
	  clipboard-indicator
		appindicator
	];
}
