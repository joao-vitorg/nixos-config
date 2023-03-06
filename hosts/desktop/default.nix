{ pkgs, lib, ... }: {
	imports = [
		./hardware-configuration.nix
	];

	environment.systemPackages = with pkgs; [
    tdesktop
  ];
}
