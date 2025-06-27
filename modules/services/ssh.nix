{ pkgs, ... }: {
  services.openssh = {
    enable = false;
    allowSFTP = true;
    settings.PermitRootLogin = "yes";
  };
}
