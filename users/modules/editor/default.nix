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
            rev = "24406f995ea20abba816c0356ebff1a025c18a72";
            sha256 = "142r41483xx7yw1gr4g1xi3rvzlprqwc72bq8rky0ys6mq50d7ic";
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

        vsnip = vimUtils.buildVimPlugin {
          name = "vim-vsnip";
          src = fetchFromGitHub {
            owner = "hrsh7th";
            repo = "vim-vsnip";
            rev = "87d144b7451deb3ab55f1a3e3c5124cfab2b02fa";
            sha256 = "17gw992xvxsa6wyirah17xbsdi2gl4lif8ibvbs7dwagnkv01vyb";
          };
        };

        vsnip-integ = vimUtils.buildVimPlugin {
          name = "vim-vsnip-integ";
          src = fetchFromGitHub {
            owner = "hrsh7th";
            repo = "vim-vsnip-integ";
            rev = "8f94cdd9ca6c3e6c328edaf22029f1bf17f3d1c5";
            sha256 = "1wh44m7jn1s7jyk0g9flf2qhkqgcl5amfi5w7dwjqkr8z495r29h";
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
        neoformat
        nerdcommenter # Review tcomment_vim?
        nvim-comp
        nvim-lspconfig
        nvim-treesitter
        nvim-treesitter-refactor
        nvim-treesitter-textobjects
        telescope-nvim
        telescope-symbols-nvim
        vim-nix
        vsnip
        vsnip-integ

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
      ${(import ./formatter.nix) pkgs}
    '';
  };
}
