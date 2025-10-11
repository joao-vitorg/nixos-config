{ pkgs, config, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ "amd_pstate=active" "amdgpu.ppfeaturemask=0xffffffff" ];
    kernelModules = [ "zenpower" ];
    extraModulePackages = [ config.boot.kernelPackages.zenpower ];
    blacklistedKernelModules = [ "k10temp" ];
  };

  nixpkgs.config.rocmSupport = true;

  services = {
    xserver.videoDrivers = [ "amdgpu" ];
  };
}
