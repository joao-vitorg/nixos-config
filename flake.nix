{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs @ { self, nixpkgs, home-manager, ... }: {
		nixosConfigurations = (
			import ./hosts {
				inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager;
      }
		);
	};
}
