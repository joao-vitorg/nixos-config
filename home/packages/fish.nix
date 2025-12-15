{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";

    shellAbbrs = {
      df = "df -Th";
      lsblk = "lsblk -f";
    };

    plugins = with pkgs.fishPlugins; [
      { name = "colored-man-pages"; src = colored-man-pages.src; }
      { name = "sponge"; src = sponge.src; }
      { name = "puffer"; src = puffer.src; }
      { name = "grc"; src = grc.src; }
    ];
  };

  home.packages = with pkgs; [ grc ];
}
