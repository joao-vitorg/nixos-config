{ pkgs, ... }: {
  imports = [
    ./docker.nix
    ./python.nix
    ./node.nix
  ];

  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    nixpkgs-fmt
    git
  ];
}
