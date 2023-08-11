{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		firefox
    tdesktop
    qalculate-gtk

    tealdeer
    htop
    wget
    ncdu
    openssl

    binutils
    coreutils
    curl
    dos2unix
    file
    inetutils
    iproute2
    unrar
    unzip
    zip
    zlib
  ];
}
