{ config, ... }: {
  xdg.configFile = {
    "MangoHud" = {
      source = config.lib.file.mkOutOfStoreSymlink "/media/codes/nixos-config/home/configs/MangoHud";
      recursive = true;
    };
    "solaar" = {
      source = config.lib.file.mkOutOfStoreSymlink "/media/codes/nixos-config/home/configs/solaar";
      recursive = true;
    };
    "Vial" = {
      source = config.lib.file.mkOutOfStoreSymlink "/media/codes/nixos-config/home/configs/Vial";
    };
  };
}
