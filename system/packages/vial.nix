{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    qmk-udev-rules
    vial
    qmk
  ];

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';
}
