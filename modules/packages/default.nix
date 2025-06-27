{ pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./nh.nix
    ./vial.nix
  ];

  environment.systemPackages = with pkgs; [
    transmission_4-gtk
    qalculate-gtk
    keepassxc
    chromium
    jackett
    vlc

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
