{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
    chromium
    inkscape
    remmina
    chromedriver
    python3
  ];
}
