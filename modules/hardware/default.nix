{ pkgs, nixos-hardware, ... }: {
	imports = with nixos-hardware.nixosModules; [
    common-cpu-intel
    common-pc-laptop
    common-pc-laptop-acpi_call
    common-pc-laptop-hdd
	];
}
