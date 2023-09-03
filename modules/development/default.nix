{ pkgs, ... }: {
	imports = [
		./robot-framework.nix
		./android.nix
		./docker.nix
		./node.nix
	];

	programs.java.enable = true;

	environment.systemPackages = with pkgs; [
		jetbrains.idea-ultimate
		graphviz
		git
	];
}
