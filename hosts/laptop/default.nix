{ pkgs, lib, nixos-hardware, ... }: {
	imports = [
		nixos-hardware.nixosModules.common-pc-ssd
		./hardware-configuration.nix
		../../modules/services/docker.nix
		../../modules/services/printer.nix
	];

	environment.systemPackages = with pkgs; [
    keepassxc
  ];
}
