{ lib, inputs, nixpkgs, home-manager, ... }:
let
  mkNix = host: nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs;
    };
    modules = [
      (./. + "/${host}")
      ./configuration.nix
      home-manager.nixosModules.home-manager {
        home-manager = {
          extraSpecialArgs = { inherit inputs; };
          useGlobalPkgs = true;
          useUserPackages = true;
          users.dallas.imports = [
            (import ./home.nix)
            (import (./. + "/${host}/home.nix"))
          ];
        };
      }
    ];
  };
in
{
  laptop = mkNix "laptop";
  desktop = mkNix "desktop";
}
