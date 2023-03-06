{ pkgs, lib, ... }: {
	imports = [
		./hardware-configuration.nix
	];

	services.xserver.displayManager.gdm.enable = true;

	environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
#    jetbrains.jdk
    git
  ];
}
