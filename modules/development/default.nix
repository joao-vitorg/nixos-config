{ pkgs, ... }: {
  imports = [
    ./docker.nix
    ./node.nix
  ];

  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    nixpkgs-fmt
    python3
    git
  ];
}
