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
        cmp-buffer = vimUtils.buildVimPlugin {
          name = "cmp-buffer";
          src = fetchFromGitHub {
            owner = "hrsh7th";
            repo = "cmp-buffer";
            rev = "5742a1b18ebb4ffc21cd07a312bf8bacba4c81ae";
            sha256 = "0nh53gqzbm500rvwc59hbl1sg12qzpk8za3z6rvsg04s6rqv479f";
          };
        };

        cmp-nvim-lsp = vimUtils.buildVimPlugin {
          name = "cmp-nvim-lsp";
          src = fetchFromGitHub {
            owner = "hrsh7th";
            repo = "cmp-nvim-lsp";
            rev = "6d991d0f7beb2bfd26cb0200ef7bfa6293899f23";
            sha256 = "0yq80sww53blvp0zq40a1744mricf4v3qafxrry4x812fv4bh8mk";
          };
        };

        nvim-comp = vimUtils.buildVimPlugin {
          name = "nvim-comp";
          src = fetchFromGitHub {
            owner = "hrsh7th";
            repo = "nvim-cmp";
            rev = "0d97bfc875be615105083bcacdab5fe72706563f";
            sha256 = "0a89pdw5rvj0haaqfvfx2ymkc6p3zdl936yc703rwksk8nzjhpni";
          };
          buildInputs = [ stylua ];
        };

        # Overrided to support HEEX (Elixir HTML template language). Check
        # default if default version supports it to remove this.
        nvim-treesitter = vimUtils.buildVimPlugin {
          name = "nvim-treesitter";
          src = fetchFromGitHub {
            owner = "nvim-treesitter";
            repo = "nvim-treesitter";
            rev = "1e4c846d01561821a737d08a6a5e2ac16d19c332";
            sha256 = "0cl2h599i4xmvgm4k8cliiz43qz6xnirh1zb8sfibdnw0fbqfpa5";
          };
        };
      in [
        # Appearance
        barbar-nvim
        catppuccino-nvim
        lualine-nvim
        nvim-web-devicons
        trouble-nvim
        vim-startify
        vim-vinegar

        # Git
        gitsigns-nvim
        vim-fugitive
        vim-rhubarb

        # Programming
        cmp-buffer
        cmp-nvim-lsp
        emmet-vim
        lspsaga-nvim
        nerdcommenter # Review tcomment_vim?
        nvim-comp
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
      ${(import ./lsp.nix) pkgs}
      ${builtins.readFile ./cmp.vim}
      ${builtins.readFile ./treesitter.vim}
      ${builtins.readFile ./telescope.vim}
      ${builtins.readFile ./git.vim}
    '';
  };
}
