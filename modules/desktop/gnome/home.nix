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

	qt = {
		enable = true;
		platformTheme = "gtk";
		style = {
      name = "Dracula";
      package = pkgs.dracula-theme;
		};
	};

	dconf.settings = {
    "org/gnome/shell" = {
			disable-user-extensions = false;
      enabled-extensions = [
        "trayIconsReloaded@selfmade.pl"
#        "drive-menu@gnome-shell-extensions.gcampax.github.com"
#        "just-perfection-desktop@just-perfection"
#        "clipboard-indicator@tudmotu.com"
#        "horizontal-workspace-indicator@tty2.io"
#        "battery-indicator@jgotti.org"
#        "gsconnect@andyholmes.github.io"
#        "forge@jmmaranan.com"
      ];
    };
	};

  home.packages = with pkgs.gnomeExtensions; [
    tray-icons-reloaded
#    battery-indicator-upower
#    just-perfection
#    clipboard-indicator
#    workspace-indicator-2
#    pop-shell
#    removable-drive-menu
#    forge # tiling windows manager
  ];
}
