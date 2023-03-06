{ pkgs, ... }: {
	hardware.sane = {
		enable = true;
		extraBackends = [ pkgs.hplipWithPlugin ];
	};

	services.printing = {
		enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
	};

  environment.systemPackages = with pkgs.gnome; [
    simple-scan
  ];
}
