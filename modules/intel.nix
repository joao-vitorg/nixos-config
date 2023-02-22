{ pkgs, ... }: {
	boot.initrd.kernelModules = [ "i915" ];

  environment.variables.LIBVA_DRIVER_NAME = "i965";

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
