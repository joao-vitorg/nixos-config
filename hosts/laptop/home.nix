{ pkgs, ... }: {
	home.packages = with pkgs; [
    jetbrains.idea-ultimate
    keepassxc
  ];

	programs = {
		git = {
			enable = true;
			userName = "joao-vitorg";
			userEmail = "jovitor737@gmail.com";
		};
	};
}
