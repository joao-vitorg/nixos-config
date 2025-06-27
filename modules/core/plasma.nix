{ pkgs, ... }: {
  services = {
    avahi.enable = false;
    hardware.bolt.enable = false;
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      autoLogin = {
        enable = true;
        user = "dallas";
      };
    };
    xserver = {
      enable = true;
      xkb.layout = "br";
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
  };
}
