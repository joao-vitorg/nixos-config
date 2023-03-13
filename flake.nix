{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs @ { self, nixpkgs, home-manager, nixos-hardware, ... }: {
		nixosConfigurations = (
			import ./hosts {
				inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager nixos-hardware;
      }
		);
	};
}
