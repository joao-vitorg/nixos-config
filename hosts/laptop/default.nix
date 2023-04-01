{ pkgs, lib, nixos-hardware, ... }: {
	imports = [
		nixos-hardware.nixosModules.common-pc-ssd
		./hardware-configuration.nix
    ../../modules/services/printer.nix
    ../../modules/development
	];

	environment.systemPackages = with pkgs; [
    keepassxc
  ];
}
