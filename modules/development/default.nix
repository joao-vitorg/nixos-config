{ pkgs, ... }: {
	imports = [
		./node.nix
		./docker.nix
	];

	programs.java.enable = true;

	environment.systemPackages = with pkgs; [
		jetbrains.idea-ultimate
		python3Minimal
		graphviz
		git
	];
}
