{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    chromedriver
    python3
    uv
  ];
}
