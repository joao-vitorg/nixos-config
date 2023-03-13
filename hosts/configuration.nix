{ config, lib, pkgs, inputs, ... }: {
	imports = [
		../modules/desktop
		../modules/programs/fish.nix
	];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    firefox
    tdesktop
    qalculate-gtk
    htop
    ncdu
  ];

  services = {
    journald.extraConfig = "Storage=volatile";
    openssh = {
      enable = true;
      allowSFTP = true;
      settings.PermitRootLogin = "yes";
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
  };

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
	    extraGroups = [ "wheel" "networkmanager" "video" "audio" "lp" "scanner" ];
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
	  loader = {
	    efi.canTouchEfiVariables = true;
	    systemd-boot.enable = true;
	  };
  };

  time.timeZone = "America/Sao_Paulo";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  nix = {
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = "experimental-features = nix-command flakes";
  };

	documentation = {
		nixos.enable = false;
		doc.enable = false;
		info.enable = false;
	};

  system.stateVersion = "22.11";
}
