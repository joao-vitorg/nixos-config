{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		firefox
    tdesktop
    qalculate-gtk
    tealdeer
    openssl
    gcc
    htop
    wget
    ncdu
    binutils
    coreutils
    curl
    unrar
    unzip
    zip
    zlib
  ];
}
