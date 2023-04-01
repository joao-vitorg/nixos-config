{ pkgs, ... }: {
  services = {
    journald.extraConfig = "Storage=volatile";

    ananicy = {
      enable = true;
			package = pkgs.ananicy-cpp;
    };

    openssh = {
      enable = true;
      allowSFTP = true;
      settings.PermitRootLogin = "yes";
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
  };
}
