{ pkgs, ... }: {
  services = {
    avahi.enable = false;
    hardware.bolt.enable = false;
    desktopManager.gnome.enable = true;
    udev.packages = with pkgs; [
      gnome-settings-daemon
    ];
    displayManager = {
      gdm.enable = true;
      autoLogin = {
        enable = true;
        user = "dallas";
      };
    };
    gnome = {
      gnome-browser-connector.enable = false;
      gnome-remote-desktop.enable = false;
      gnome-initial-setup.enable = false;
      gnome-user-share.enable = false;
      gnome-keyring.enable = true;
      rygel.enable = false;
    };
    xserver = {
      enable = true;
      xkb.layout = "br";
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = false;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      dconf-editor
      gnome-tweaks
    ];
    gnome.excludePackages = (with pkgs; [
      gnome-system-monitor
      gnome-backgrounds
      gnome-font-viewer
      gnome-calculator
      gnome-characters
      gnome-contacts
      gnome-weather
      gnome-clocks
      gnome-music
      gnome-logs
      gnome-maps
      gnome-tour
      epiphany
      snapshot
      baobab
      geary
      orca
      yelp
    ]);
  };
}
