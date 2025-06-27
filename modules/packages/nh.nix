{ pkgs, ... }: {
  programs.nh = {
    enable = true;
    flake = "/media/codes/nixos-config";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
