{ pkgs, ... }: {
	users.users.dallas.extraGroups = [ "uinput" ];

  services.kanata = {
    enable = true;
    keyboards.default.config = ''
      (defsrc
        caps)

      (deflayermap (default-layer)
        ;; tap caps lock as caps lock, hold caps lock as left control
        caps (tap-hold 100 100 (movemouse-up 50 120) lctl))
    '';
  };
}
