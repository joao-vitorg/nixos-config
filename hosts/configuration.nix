{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ../modules/desktop
    ../modules/services
    ../modules/programs/base.nix
  ];

  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;

  security = {
    rtkit.enable = true;
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
      initialPassword = "password";
      extraGroups = [ "wheel" "networkmanager" "video" "audio" "adbusers" ];
    };
  };

  systemd = {
    oomd.enable = false;
    services.NetworkManager-wait-online.enable = false;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.grub.device = "/dev/sda";
    tmp.cleanOnBoot = true;
  };

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  nix = {
    package = pkgs.nixVersions.latest;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = "experimental-features = nix-command flakes";
  };

  documentation.nixos.enable = false;

  system.stateVersion = "23.11";
}
