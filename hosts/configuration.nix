{ config, lib, pkgs, inputs, ... }: {
	imports = [
		../modules/desktop
		../modules/services
	];

	nixpkgs.config.allowUnfree = true;
	programs.fish.enable = true;
	environment.systemPackages = with pkgs; [
		firefox
		tdesktop
		qalculate-gtk
		htop
		ncdu
		wget
	];

	security = {
		rtkit.enable = true;
		sudo.enable = false;
		doas = {
			enable = true;
			extraRules = [{
				users = [ "dallas" ];
				keepEnv = true;
				persist = true;
			}];
		};
	};

	users = {
		defaultUserShell = pkgs.fish;
		users.dallas = {
			isNormalUser = true;
			extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
		};
	};

	systemd = {
		oomd.enable = false;
		services.NetworkManager-wait-online.enable = false;
	};

	boot = {
		kernelPackages = pkgs.linuxPackages_latest;
		tmp.useTmpfs = true;
		loader = {
			efi.canTouchEfiVariables = true;
			systemd-boot.enable = true;
		};
	};

	time.timeZone = "America/Sao_Paulo";
	console = {
		font = "Lat2-Terminus16";
#    keyMap = "br-abnt2";
	};

	nix = {
		package = pkgs.nixVersions.unstable;
		registry.nixpkgs.flake = inputs.nixpkgs;
		extraOptions = "experimental-features = nix-command flakes";
	};

	hardware.enableRedistributableFirmware = true;

	documentation.nixos.enable = false;

	system.stateVersion = "22.11";
}
