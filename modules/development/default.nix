{ pkgs, ... }: {
  imports = [
    ./docker.nix
    ./kvm.nix
    ./node.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    jetbrains.idea-ultimate
    jetbrains.jdk
    graphviz
  ];
}
