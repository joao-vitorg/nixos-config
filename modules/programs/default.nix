{ pkgs, ... }: {
  imports = [
    ./fish.nix
    ./firefox
  ];
}
