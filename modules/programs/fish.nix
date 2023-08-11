{ pkgs, ... }: {
	programs.fish = {
		enable = true;

		interactiveShellInit = "set fish_greeting";

		shellAbbrs = {
			df = "df -Th";
			lsblk = "lsblk -f";
		};

		functions = {
			nix-copilot = "ln -fs /run/current-system/sw/bin/copilot-agent ~/.local/share/JetBrains/IntelliJIdea2023.2/github-copilot-intellij/copilot-agent/bin/copilot-agent-linux";
			nix-hardware = "doas nixos-generate-config \n cp /etc/nixos/hardware-configuration.nix /media/flakes/hosts/laptop";
			nix-gc = "doas nix-env --delete-generations old --profile /nix/var/nix/profiles/system \n doas nix-collect-garbage -d \n doas nix-store --optimize";
			nix-check = "nix flake check --recreate-lock-file --allow-dirty \n doas nix-channel --update";
			nix-test = "doas nixos-rebuild test --flake .#laptop";
			nix-boot = "doas nixos-rebuild boot --flake .#laptop";
			nix-update = "nix-check \n nix-gc \n nix-boot";
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
