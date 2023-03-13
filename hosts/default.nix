{ lib, inputs, nixpkgs, home-manager, nixos-hardware, ... }:
	let
		mkNix = host: nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			specialArgs = {
				inherit inputs nixos-hardware;
			};

			modules = [
				(./. + "/${host}")
				./configuration.nix
				../modules/hardware
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.dallas.imports = [
						(import ./home.nix)
						(import (./. + "/${host}/home.nix"))
					];
				}
			];
		};
	in {
		laptop = mkNix "laptop";
		desktop = mkNix "desktop";
}
