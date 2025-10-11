{ pkgs, ... }: {
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.systemPackages = [
    pkgs.docker-compose
  ];
}
