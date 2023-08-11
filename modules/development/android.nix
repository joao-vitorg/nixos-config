{ pkgs, ... } : {
  programs.adb.enable = true;

  users.users.dallas.extraGroups = ["adbusers"];

  environment.systemPackages = [
    pkgs.android-studio
  ];
}
