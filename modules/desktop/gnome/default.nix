{ pkgs, ... }: {
	services = {
		avahi.enable = false;
		gnome.gnome-browser-connector.enable = false;
		udev.packages = with pkgs.gnome; [
			gnome-settings-daemon
		];
		xserver = {
      enable = true;
      layout = "br";
			desktopManager.gnome.enable = true;
		};
	};

	hardware = {
		pulseaudio.enable = false;
		bluetooth.enable = false;
	};

	environment = {
    systemPackages = with pkgs.gnome; [
      dconf-editor
      gnome-tweaks
    ];
		gnome.excludePackages = (with pkgs; [
	    gnome-photos
	    gnome-tour
	    orca
	  ]) ++ (with pkgs.gnome; [
	    cheese
	    epiphany
	    gnome-characters
	    gnome-clocks
	    gnome-contacts
	    gnome-font-viewer
	    gnome-maps
	    gnome-music
	    gnome-weather
	    yelp
      gnome-backgrounds
      gnome-bluetooth
	    geary
	  ]);
  };
}
