{ pkgs, ... }: {
	imports = [
		./robot-framework.nix
		./android.nix
		./docker.nix
		./cloud.nix
		./node.nix
	];

	environment.systemPackages = with pkgs; [
		jetbrains.idea-ultimate
		graphviz
		git
	];
}
