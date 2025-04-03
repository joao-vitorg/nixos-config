{ pkgs, ... }: {
  imports = [
    ./printer.nix
  ];

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
  };
}
