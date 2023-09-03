{ pkgs, ... }: {
  programs.adb.enable = true;
  users.users.dallas.extraGroups = [ "adbusers" ];

	networking.firewall.allowedTCPPorts = [ 8081 ];

  environment.systemPackages = with pkgs; [
    nodePackages.eas-cli
  ];
}
