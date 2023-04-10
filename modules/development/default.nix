{ pkgs, ... }: {
  imports = [
    ./kvm.nix
    ./node.nix
    ./mariadb.nix
  ];

  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.jdk
    graphviz
    git
  ];
}
