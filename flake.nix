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
    nixosConfigurations.dallas = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hardware-configuration.nix
        ./system
        home-manager.nixosModules.home-manager {
          home-manager = {
            extraSpecialArgs = { inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = true;
            users.dallas.imports = [
              (import ./home)
            ];
          };
        }
      ];
    };
  };
}
