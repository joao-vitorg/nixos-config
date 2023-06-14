{ pkgs, ... }: {
	imports = [
		./node.nix
		./docker.nix
		./robot-framework.nix
	];

	programs.java.enable = true;

	environment.systemPackages = with pkgs; [
		jetbrains.idea-ultimate
		graphviz
		python3
		git
	];
}
