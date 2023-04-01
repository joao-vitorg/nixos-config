{ pkgs, ... }: {
	users.users.dallas.extraGroups = [ "docker" ];

	virtualisation.docker.enable = true;

	environment.systemPackages = with pkgs; [
		docker-compose
	];
}
