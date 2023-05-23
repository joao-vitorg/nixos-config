{ pkgs, ... }: {
	programs.fish = {
		enable = true;

		interactiveShellInit = "set fish_greeting";

		shellAbbrs = {
			df = "df -Th";
			nix-check = "nix flake check --recreate-lock-file";
			nix-switch = "doas nixos-rebuild switch --flake .#laptop";
			nix-boot = "doas nixos-rebuild boot --flake .#laptop";
			nix-hardware = "doas nixos-generate-config ;; cp /etc/nixos/hardware-configuration.nix ./hosts/laptop";
			nix-gc = "doas nix-env --delete-generations old --profile /nix/var/nix/profiles/system ;; doas nix-collect-garbage -d";
		};

		plugins = with pkgs.fishPlugins; [
			{ name = "colored-man-pages"; src = colored-man-pages.src; }
			{ name = "fzf-fish"; src = fzf-fish.src; }
			{ name = "sponge"; src = sponge.src; }
			{ name = "grc"; src = grc.src; }
		];
	};

	home.packages = with pkgs; [
		fzf
		grc
	];
}
