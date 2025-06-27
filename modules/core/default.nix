{ pkgs, ... }: {
  imports = [
    ./gpu.nix
    ./plasma.nix
  ];

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = false;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
