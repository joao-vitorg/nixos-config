{ pkgs, ... }: {
  imports = [
    ./gpu.nix
    ./plasma.nix
  ];

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = false;
    amdgpu.initrd.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  environment.shellAliases = {
    nix-hardware = "doas nixos-generate-config && cp /etc/nixos/hardware-configuration.nix /media/codes/nixos-config/hosts/laptop";
    nix-konsave = "konsave -f -s dallas";

    nix-update = "nix flake update --flake /media/codes/nixos-config --allow-dirty && doas nix-channel --update";
    nix-boot = "nixos-rebuild boot --flake /media/codes/nixos-config#dallas --sudo";
    nix-test = "nixos-rebuild test --flake /media/codes/nixos-config#dallas --sudo";
    nix-gc = "doas nix-env --delete-generations old --profile /nix/var/nix/profiles/system && doas nix-collect-garbage -d && doas nix-store --optimize";
    nix-upgrade = "nix-update && nix-boot && nix-gc";
  };
}
