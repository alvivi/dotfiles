{ pkgs, ... }: {
  home.packages = with pkgs; [ neovim-remote ripgrep silver-searcher ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Plugins To Review
    # - vim-table-mode
    # - vim-which-key (has catppuccino integration)
    # - seneak.vim (has catppuccino integration)
    # - fern / nvimtree / luatree  (has catppuccino integration)

    plugins = with pkgs;
      with pkgs.vimPlugins;
      let
        virtual-column-nvim = vimUtils.buildVimPlugin {
          name = "virtual-column-nvim";
          src = fetchFromGitHub {
            owner = "davepinto";
            repo = "virtual-column.nvim";
            rev = "d6ae0b0fe4dc31b3351c469b9c55e987e99938cb";
            sha256 = "0r9jq59hl3d64hih1qf2axh74rib7f2ypv9ljwdmriz8mdq2a16i";
          };
        };
      in
      [

        # Appearance

        barbar-nvim
        catppuccin-nvim
        indent-blankline-nvim
        lualine-nvim
        nvim-web-devicons
        vim-startify
        vim-vinegar
        virtual-column-nvim

        # Git

        gitsigns-nvim
        vim-fugitive
        vim-rhubarb

        # Programming

        cmp-buffer
        cmp-nvim-lsp
        emmet-vim
        lspsaga-nvim
        neoformat
        nerdcommenter # Review tcomment_vim?
        nvim-cmp
        nvim-lspconfig
        nvim-treesitter
        nvim-treesitter-refactor
        nvim-treesitter-textobjects
        telescope-nvim
        telescope-symbols-nvim
        trouble-nvim
        vim-easymotion
        vim-vsnip
        vim-vsnip
        vim-vsnip-integ

        # Misc

        YankRing-vim # Review
        undotree # Review?

        # Dependencies

        plenary-nvim
        popup-nvim
      ];

    extraConfig = ''
      ${builtins.readFile ./defaults.vim}
      ${builtins.readFile ./base.vim}
      ${builtins.readFile ./theme.vim}
      ${builtins.readFile ./term.vim}
      ${builtins.readFile ./git.vim}
      ${builtins.readFile ./treesitter.vim}
      ${builtins.readFile ./telescope.vim}
      ${(import ./lsp.nix) pkgs}
      ${builtins.readFile ./cmp.vim}
      ${(import ./formatter.nix) pkgs}
    '';
  };
}
