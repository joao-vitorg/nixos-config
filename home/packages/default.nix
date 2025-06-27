{ pkgs, ... }: {
  imports = [
    ./firefox
    ./fish.nix
    ./git.nix
  ];
}
