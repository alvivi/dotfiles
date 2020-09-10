{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {
      nur = import <nur> {
        inherit pkgs;
      };
    };
  };

  home = {
    packages = with pkgs; [
      bat
      gcolor3
      lsd
      neovim-remote
      nerdfonts
      nixfmt
      peco
      ripgrep
      silver-searcher
      slack-dark
      spotify
      xcape
      xclip
    ];

    keyboard = {
      layout = "us";
      options = [ "eurosign:e" "ctrl:nocaps" ];
    };

    file.".local/share/applications/neovim.desktop" = {
      text = ''
        [Desktop Entry]
        Encoding=UTF-8
        Name=NeoVim
        Exec=kitty zsh -c "xcape && nvim"
        Icon=nvim
        Type=Application
        Categories=Development
      '';
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
  };

  services = {
    xcape = {
      enable = true;
      mapExpression = { Control_L = "Escape"; };
    };
  };

  programs = {
    firefox = {
      enable = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        sidebery
        ublock-origin
        vimium
      ];
      profiles.alvivi = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          #back-button { background-color: #2D2D2D; }
          #titlebar { visibility: collapse !important; }
        '';
      };
    };

    fzf = { enable = true; };

    git = {
      enable = true;
      # TODO: Check if available on update
      # delta.enable = true;
      lfs.enable = true;
      userEmail = "alvivi@gmail.com";
      userName = "Alvaro Vilanova Vidal";
      signing = {
        key = "D32AF8A4C4B4595E";
        signByDefault = true;
      };
    };

    # TODO: Check if available on update
    # gpg-agent = {
    #   enable = true;
    # };

    home-manager = { enable = true; };

    kitty = {
      enable = true;
      font.name = "Iosevka Term";
      settings = {
        disable_ligatures = "cursor";
        sync_to_monitor = "yes";
        mouse_hide_wait = "-1";
      };
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [
        emmet-vim
        fzf-vim
        nerdcommenter
        undotree
        vim-airline
        vim-airline-themes
        vim-devicons
        vim-easymotion
        vim-fugitive
        vim-gitgutter
        vim-nix
        vim-one
        vim-rhubarb
        vim-startify
        vim-vinegar
        yankring
      ];
      extraConfig = builtins.readFile ./config.vim;
    };

    zsh = {
      enable = true;
      defaultKeymap = "emacs";
      oh-my-zsh = {
        enable = true;
        theme = "pygmalion";
      };
      plugins = [{
        name = "zsh-prezto";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "v1.13.0";
          sha256 = "16q9v4c8lagp4vxm7qhagilqnwf1g4pbds56x5wfj4cwc0x2gclw";
        };
      }];
      initExtra = ''
        autoload -U promptinit; promptinit
        prompt pure

        if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
          if [ -x "$(command -v nvr)" ]; then
            alias nvim=nvr
          else
            alias nvim='echo "No nesting!"'
          fi
        fi

        function gsina {
          git status --porcelain \
          | awk '{ if (substr($0, 0, 2) ~ /^[ ?].$/) print $0 }' \
          | peco \
          | awk '{ print "'`git rev-parse --show-toplevel`'/"$2 }'
        }
      '';
      sessionVariables = { ERL_AFLAGS = "-kernel shell_history enabled"; };
      shellAliases = {
        cat = "bat";
        dockerbash =
          "docker ps --format '{{.ID}}: {{.Image}} {{.Names}}' | peco | sed 's/: .*//g' | xargs -I{} -ot docker exec -ti {} /bin/bash";
        dockerkill =
          "docker ps --format '{{.ID}}: {{.Image}} {{.Names}}' | peco | sed 's/: .*//g' | xargs -I{} -ot docker kill {}";
        dockersh =
          "docker ps --format '{{.ID}}: {{.Image}} {{.Names}}' | peco | sed 's/: .*//g' | xargs -I{} -ot docker exec -ti {} /bin/sh";
        dockerstop =
          "docker ps --format '{{.ID}}: {{.Image}} {{.Names}}' | peco | sed 's/: .*//g' | xargs -I{} -ot docker stop {}";
        g = "git";
        ga = "git add";
        gai = "gsina | xargs git add";
        gaip = "gsina | xargs -o git add -p";
        gapa = "git add --patch --all";
        gb = "git branch";
        gbdi = "git branch | peco | xargs git branch -d";
        gc = "git commit";
        gco = "git checkout";
        gcoi =
          "git branch --all | peco | sed 's/remotes/origin///g' | xargs git checkout";
        gd = "git diff";
        gdi = "gsina | xargs -o git diff";
        gf = "git fetch --all";
        gfico = "gsina | xargs git checkout";
        gfire = "gsina | xargs git reset";
        ghl = "git stash list";
        ghp = "git stash pop";
        git = "noglob git";
        gl = "git log";
        gp = "git push";
        gpo = "git push origin";
        gpot = "git push origin --tags";
        gpuo =
          "git push -u origin --force-with-lease `git rev-parse --abbrev-ref HEAD`";
        gr = "git reset";
        grc = "git rev-list -n 1 HEAD --";
        gri = "gsina | git reset";
        gs = "git status";
        gull = "git pull";
        ls = "lsd";
      };
    };
  };
}
