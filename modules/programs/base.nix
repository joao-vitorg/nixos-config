{ pkgs, ... }: {
  imports = [
    ./nh.nix
  ];

  environment.systemPackages = with pkgs; [
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
