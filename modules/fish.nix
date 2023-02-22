{ pkgs, ... }: {
	programs.fish = {
    enable = true;
    shellAliases = {
      df = "df -Th";
      nix-check = "doas nix flake check --recreate-lock-file";
      nix-switch = "doas nixos-rebuild switch --flake .#laptop";
      nix-boot = "doas nixos-rebuild boot --flake .#laptop";
      nix-hardware = "doas nixos-generate-config ;; cp /etc/nixos/hardware-configuration.nix ./hosts/laptop";
      nix-gc = "doas nix-collect-garbage -d ;; doas nix-store --optimize";
    };
	};

	environment.systemPackages = with pkgs.fishPlugins; [
	  pkgs.fzf
		fzf-fish
		sponge
	];
}
