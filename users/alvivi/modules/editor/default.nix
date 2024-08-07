{ pkgs, ... }: {
  home.packages = with pkgs; [ neovim-remote ripgrep silver-searcher ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      vim.g.lsp_elixir_bin = "${pkgs.elixir_ls}/bin/elixir-ls"
      vim.g.lsp_tsserver_bin = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server"
      vim.g.lsp_tsserver_ts_path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib"

      ${builtins.readFile ./defaults.lua}
      ${builtins.readFile ./base.lua}
      ${builtins.readFile ./theme.lua}
      ${builtins.readFile ./term.lua}
      ${builtins.readFile ./git.lua}
      ${builtins.readFile ./treesitter.lua}
      ${builtins.readFile ./telescope.lua}
      ${builtins.readFile ./lsp.lua}
      ${builtins.readFile ./cmp.lua}
    '';

    plugins = with pkgs;
      with pkgs.vimPlugins;
      let
        virt-column-nvim = vimUtils.buildVimPlugin {
          name = "virt-column-nvim";
          src = fetchFromGitHub {
            owner = "lukas-reineke";
            repo = "virt-column.nvim";
            rev = "b62b4ef0774d19452d4ed18e473e824c7a756f2f";
            hash = "sha256-7ljjJ7UwN2U1xPCtsYbrKdnz6SGQGbM/HrxPTxNKlwo=";
          };
        };
      in
      [
        # Appearance

        catppuccin-nvim
        indent-blankline-nvim
        nvim-web-devicons
        virt-column-nvim

        # Git

        gitsigns-nvim
        vim-fugitive
        vim-rhubarb

        # Programming

        cmp-nvim-lsp
        lsp-format-nvim
        lspsaga-nvim
        nvim-lspconfig
        nvim-treesitter
        nvim-treesitter-refactor
        nvim-treesitter-textobjects # TODO: Review and update config
        trouble-nvim

        # Misc

        barbar-nvim
        cmp-buffer
        emmet-vim
        lualine-nvim
        nerdcommenter # TODO: Review tcomment_vim
        nvim-cmp
        telescope-nvim
        telescope-symbols-nvim
        vim-easymotion
        vim-startify
        vim-vinegar
        vim-vsnip
        vim-vsnip
        vim-vsnip-integ

        # Dependencies

        plenary-nvim
        popup-nvim
        YankRing-vim # TODO: Review
        undotree # TODO: Review

        #     # TODO: Review neoformat
        #     # TODO: Review vim-table-mode
        #     # TODO: Review vim-which-key (has catppuccino integration)
        #     # TODO: Review - seneak.vim (has catppuccino integration)
        #     # TODO: Review fern / nvimtree / luatree  (have catppuccino integration)
      ];

  };
}
