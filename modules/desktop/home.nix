{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
    };
  };

  dconf.settings = {
    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [ "&DESKTOP" "&DOCUMENTS" "&MUSIC" "&PICTURES" "&VIDEOS" "/media" ];
      index-single-directories = [ "&DOWNLOAD" "$HOME" ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/shell/extensions/just-perfection" = {
        hide-power-button = true;
        hide-switch-user-button = true;
        show-tooltip = true;
    };
    "org/gnome/shell" = {
      enabled-extensions = [
        "just-perfection-desktop@just-perfection"
        "appindicatorsupport@rgcjonas.gmail.com"
        "clipboard-indicator@tudmotu.com"
        "solaar-extension@sidevesh"
      ];
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    clipboard-indicator
    solaar-extension
    just-perfection
    appindicator
  ];
}
