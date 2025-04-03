{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    tdesktop
    resources
    gimp
    openssl
    gcc
    htop
    p7zip
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
