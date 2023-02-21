{ config, lib, pkgs, inputs, ... }: {
	imports = (import ../modules/desktop);

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    htop
    ncdu
  ];

	security.rtkit.enable = true;

  services = {
    journald.extraConfig = "Storage=volatile";
    openssh = {
      enable = true;
      allowSFTP = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  users = {
		defaultUserShell = pkgs.fish;
    users.dallas = {
	    isNormalUser = true;
	    extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
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

  system.stateVersion = "22.11";
}
