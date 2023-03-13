{ pkgs, ... }: {
	hardware.sane = {
		enable = true;
		extraBackends = [ pkgs.hplip ];
	};

	services.printing = {
		enable = true;
    drivers = [ pkgs.hplip ];
	};

  environment.systemPackages = with pkgs.gnome; [
    simple-scan
  ];
}
