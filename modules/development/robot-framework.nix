{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
    chromedriver
    chromium
		python3
		inkscape
	];
}
