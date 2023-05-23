{ pkgs, ... }: {
	imports = [
		./ananicy.nix
	];

	services = {
		journald.extraConfig = "Storage=volatile";

		openssh = {
			enable = true;
			allowSFTP = true;
			settings.PermitRootLogin = "yes";
		};

		pipewire = {
			enable = true;
			pulse.enable = true;
			alsa.enable = true;
		};
	};
}
