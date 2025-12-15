{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings.user = {
      name = "joao-vitorg";
      email = "101678877+joao-vitorg@users.noreply.github.com";
    };
  };
}
