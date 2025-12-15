{ pkgs, ... }: {
  imports = [
    ./docker.nix
    ./node.nix
    ./sankhya.nix
  ];

  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    nixpkgs-fmt
#    localstack
#    awscli2
    python3
    git
  ];
}
