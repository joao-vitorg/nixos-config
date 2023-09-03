{ pkgs, lib, ... }: {
	imports = [
		./hardware-configuration.nix
		../../modules/services/printer.nix
		../../modules/development
	];

	services.fstrim.enable = true;

	environment.systemPackages = with pkgs; [
		keepassxc
		gimp
	];
}
