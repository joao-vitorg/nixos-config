{ pkgs, ... }: {
	programs.fish = {
    enable = true;
    shellAliases = {
      df = "df -Th";
      nix-check = "sudo nix flake check --recreate-lock-file";
      nix-test = "sudo nixos-rebuild test --flake .#laptop";
      nix-boot = "sudo nixos-rebuild boot --flake .#laptop";
      nix-hardware = "sudo nixos-generate-config --dir /media/flakes/hosts/laptop";
      nix-gc = "sudo nix-collect-garbage -d";
    };
	};

	environment.systemPackages = with pkgs.fishPlugins; [
	  pkgs.fzf
	  pkgs.grc
		colored-man-pages
		fzf-fish
		sponge
		grc
	];
}
