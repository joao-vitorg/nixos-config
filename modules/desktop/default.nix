{ pkgs, ... }: {
	services = {
		avahi.enable = false;
		hardware.bolt.enable = false;
		udev.packages = with pkgs.gnome; [
			gnome-settings-daemon
		];
		gnome = {
			gnome-browser-connector.enable = false;
			gnome-remote-desktop.enable = false;
			gnome-initial-setup.enable = false;
			gnome-user-share.enable = false;
			rygel.enable = false;
		};
		xserver = {
			enable = true;
      layout = "br";
			desktopManager.gnome.enable = true;
			displayManager = {
				gdm.enable = true;
				autoLogin = {
					enable = true;
					user = "dallas";
				};
			};
		};
	};

	hardware = {
		enableRedistributableFirmware = true;
		pulseaudio.enable = false;
		bluetooth.enable = false;
	};

	environment = {
		systemPackages = with pkgs.gnome; [
			dconf-editor
			gnome-tweaks
		];
		gnome.excludePackages = (with pkgs.gnome; [
			pkgs.gnome-photos
			pkgs.gnome-tour
			pkgs.orca
			gnome-disk-utility
			gnome-backgrounds
			gnome-font-viewer
			gnome-calculator
			gnome-characters
			gnome-bluetooth
			gnome-contacts
			gnome-weather
			gnome-clocks
			gnome-music
			gnome-logs
			gnome-maps
			simple-scan
			epiphany
			baobab
			cheese
			geary
			totem
			yelp
		]);
	};
}
