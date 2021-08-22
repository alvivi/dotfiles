{ pkgs, ... }: {
  home.packages = with pkgs; [ neovim-remote ripgrep silver-searcher ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Plugins To Review
    # - vim-table-mode
    # - barbar-nvim & galaxyline-nvim
    # - vim-which-key

    plugins = with pkgs.vimPlugins; [
      # Appearance
      nvim-web-devicons
      vim-airline
      vim-airline-themes
      vim-one
      vim-startify
      vim-vinegar

      # Git
      vim-fugitive
      vim-gitgutter
      vim-rhubarb

      # Programming
      emmet-vim
      lspsaga-nvim
      nerdcommenter # Review tcomment_vim?
      nvim-compe
      nvim-lspconfig
      nvim-treesitter
      nvim-treesitter-refactor
      nvim-treesitter-textobjects
      telescope-nvim
      telescope-symbols-nvim
      vim-nix

      # Dependencies
      plenary-nvim
      popup-nvim

      # Misc
      YankRing-vim # Review
      undotree # Review?
      vim-easymotion
    ];

    extraConfig = ''
      ${builtins.readFile ./defaults.vim}
      ${builtins.readFile ./base.vim}
      ${builtins.readFile ./theme.vim}
      ${builtins.readFile ./term.vim}
      ${builtins.readFile ./treesitter.vim}
      ${builtins.readFile ./telescope.vim}
      ${builtins.readFile ./git.vim}
    '';
  };
}
