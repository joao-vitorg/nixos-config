{ pkgs, ... }: {
  services.openssh = {
    enable = true;
    allowSFTP = true;
    settings.PermitRootLogin = "yes";
  };
}
