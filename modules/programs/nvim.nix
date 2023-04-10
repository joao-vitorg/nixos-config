{ pkgs, ... }: {
	programs.neovim = {
		enable = true;
		vimAlias = true;
		defaultEditor = true;

		extraConfig = ''
			syntax enable
      set nu
      set relativenumber
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set expandtab
      set smartindent
      set autoindent
      set scrolloff=8
      set nowrap
      colorscheme dracula
		'';

		plugins = with pkgs.vimPlugins; [
			vim-nix
			dracula-nvim
		];
	};
}
