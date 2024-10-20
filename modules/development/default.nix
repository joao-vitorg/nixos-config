{ pkgs, ... }: {
  imports = [
    ./docker.nix
    ./python.nix
    ./node.nix
  ];

  programs.java.enable = true;

  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    git
  ];
}
