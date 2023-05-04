{ pkgs, ... }: {
  imports = [
    ./node.nix
    ./mariadb.nix
  ];

  programs.java.enable = true;

  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    graphviz
    python3
    git
  ];
}
