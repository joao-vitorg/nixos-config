{ pkgs, ... } : {
  environment.systemPackages = with pkgs.nodePackages; [
    pkgs.nodejs-slim
    pnpm
    prettier
  ];
}
