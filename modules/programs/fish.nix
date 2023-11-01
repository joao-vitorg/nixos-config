{ pkgs, ... }: {
	programs.fish = {
		enable = true;

		interactiveShellInit = "set fish_greeting";

		shellAbbrs = {
			df = "df -Th";
			lsblk = "lsblk -f";
		};

		functions = {
			nix-hardware = "doas nixos-generate-config \n cp /etc/nixos/hardware-configuration.nix /media/codes/nixos-config/hosts/laptop";
			nix-update = "nix flake check --recreate-lock-file --allow-dirty \n doas nix-channel --update";
			nix-gc = "doas nix-env --delete-generations old --profile /nix/var/nix/profiles/system \n doas nix-collect-garbage -d \n doas nix-store --optimize";
			nix-test = "doas nixos-rebuild test --flake .#laptop";
			nix-boot = "doas nixos-rebuild boot --flake .#laptop";
			nix-copilot = "ln -fs /run/current-system/sw/bin/copilot-agent ~/.local/share/JetBrains/IntelliJIdea2023.2/github-copilot-intellij/copilot-agent/bin/copilot-agent-linux";
			nix-upgrade = "nix-update \n nix-gc \n nix-boot \n nix-copilot";
		};

		plugins = with pkgs.fishPlugins; [
			{ name = "colored-man-pages"; src = colored-man-pages.src; }
			{ name = "sponge"; src = sponge.src; }
			{ name = "puffer"; src = puffer.src; }
			{ name = "grc"; src = grc.src; }
		];
	};

	home.packages = with pkgs; [ grc ];
}
