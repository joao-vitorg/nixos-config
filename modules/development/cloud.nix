{ pkgs, ... } : {
	environment.systemPackages = with pkgs; [
		terraformer
		terraform
		awscli2
	];
}
