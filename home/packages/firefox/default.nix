{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "dallas";
      isDefault = true;
      userChrome = (builtins.readFile ./userChrome.css);
    };
  };
}
