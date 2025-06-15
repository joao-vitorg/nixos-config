{ config, ... }: {
  xdg.configFile = {
    "solaar" = {
      source = config.lib.file.mkOutOfStoreSymlink "/media/codes/nixos-config/dotfiles/solaar";
      recursive = true;
    };
    ".config/Vial/Vial.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink "/media/codes/nixos-config/dotfiles/Vial/Vial.conf";
    };
    "MangoHud" = {
      source = config.lib.file.mkOutOfStoreSymlink "/media/codes/nixos-config/dotfiles/MangoHud";
      recursive = true;
    };
  };
}
