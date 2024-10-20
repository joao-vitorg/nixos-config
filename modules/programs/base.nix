{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    tdesktop
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
