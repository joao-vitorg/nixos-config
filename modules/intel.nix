{ pkgs, ... }: {
  services.xserver.videoDrivers = [ "intel" ];

  environment.variables.VDPAU_DRIVER = "va_gl";

  boot.initrd.kernelModules = [ "i915" ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      vaapiIntel
      libvdpau-va-gl
      intel-media-driver
    ];
  };
}
