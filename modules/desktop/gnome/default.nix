{ pkgs, ... }: {
	services = {
		avahi.enable = false;
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
	    gnome-music
	    gedit
	    epiphany
	    geary
	    yelp
      adwaita-icon-theme
      gnome-backgrounds
      gnome-bluetooth
	    gnome-characters
	    gnome-contacts
	    gnome-maps
	    gnome-music
	    gnome-weather
	  ]);
  };
}
