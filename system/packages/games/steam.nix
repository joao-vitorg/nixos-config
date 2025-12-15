{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      protonup-ng
    ];
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/dallas/.steam/root/compatibilitytools.d/";
    };
  };
}
