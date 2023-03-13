{ pkgs, ... }: {
  imports = [
    ./node.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    jetbrains.idea-ultimate
    jetbrains.jdk
    graphviz
  ];
}
