{ pkgs, ... }: {
  openssh = {
    enable = false;
    allowSFTP = true;
    settings.PermitRootLogin = "yes";
  };
}
