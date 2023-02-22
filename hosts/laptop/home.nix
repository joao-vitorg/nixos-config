{ pkgs, ... }: {
	home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.jdk
    visualvm
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
