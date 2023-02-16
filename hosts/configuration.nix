{ config, lib, pkgs, inputs, ... }: {
	imports = [
		../modules/fish.nix
		../modules/intel.nix
	];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    htop
    ncdu
    xarchiver
    xfce.xfce4-whiskermenu-plugin
    xfce.thunar-archive-plugin
  ];

  services = {
#    journald.extraConfig = "Storage=none";
    openssh = {
      enable = true;
      allowSFTP = true;
    };
    xserver = {
      enable = true;
      layout = "br";
      desktopManager.gnome.enable = true;
#      displayManager.gdm.enable = true;
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
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  sound.enable = true;
  networking.networkmanager.enable = true;
  hardware = {
    cpu.intel.updateMicrocode = true;
    pulseaudio.enable = true;
  };

  nix = {
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = "experimental-features = nix-command flakes";
  };

  system.stateVersion = "22.11";
}
