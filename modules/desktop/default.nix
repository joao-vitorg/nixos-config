{ pkgs, ... }: {
  services = {
    avahi.enable = false;
    hardware.bolt.enable = false;
    udev.packages = with pkgs; [
      gnome-settings-daemon
    ];
    displayManager.autoLogin = {
      enable = true;
      user = "dallas";
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
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    pulseaudio.enable = false;
    bluetooth.enable = false;
  };

  environment = {
    systemPackages = with pkgs; [
      dconf-editor
      gnome-tweaks
    ];
    gnome.excludePackages = (with pkgs; [
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
