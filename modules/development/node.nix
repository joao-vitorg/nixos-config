{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nodePackages.pnpm
    nodejs-slim
  ];
}
