{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {
      nur = import <nur> { inherit pkgs; };
      unstable = import <nixos-unstable> { };

      nerdfonts-iosevka = pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; };
    };
  };

  home = {
    packages = with pkgs; [
      bat
      docker
      docker-compose
      gcolor3
      gitAndTools.gh
      inotify-tools
      lsd
      neovim-remote
      nerdfonts-iosevka
      ngrok
      nix-prefetch-git
      nixfmt
      nodejs-12_x
      openvpn
      peco
      ripgrep
      silver-searcher
      slack-dark
      spotify
      tig
      unstable.beam.interpreters.erlangR23
      unstable.beam.packages.erlangR23.elixir_1_11
      xcape
      xclip
    ];

    # keyboard = {
    #   layout = "us";
    #   options = [ "eurosign:e" "ctrl:nocaps" ];
    # };

    file = {
      "Pictures/Wallpapers/mad_dog_jones_001.png" = {
        source = builtins.fetchurl {
          url =
            "https://raw.githubusercontent.com/alvivi/dotfiles/master/wallpapers/mad_dog_jones_001.png";
          sha256 = "116p7w4f8n01y4jh5983a11sn3z54nz42a9318fp154ys4qhlyf5";
        };
      };
      "Pictures/Wallpapers/mad_dog_jones_002.png" = {
        source = builtins.fetchurl {
          url =
            "https://raw.githubusercontent.com/alvivi/dotfiles/master/wallpapers/mad_dog_jones_002.png";
          sha256 = "1xwbaxw9h3vgamyfskw55amn4cdp3rmk817sjmvdihi0rfk4f6mz";
        };
      };
      "Pictures/Wallpapers/mad_dog_jones_003.png" = {
        source = builtins.fetchurl {
          url =
            "https://raw.githubusercontent.com/alvivi/dotfiles/master/wallpapers/mad_dog_jones_003.png";
          sha256 = "1mvcr6lpx03ar9m9dimv19k4ff1xj97s8zsm1xhqm0034g61lycw";
        };
      };
      "Pictures/Wallpapers/mad_dog_jones_004.png" = {
        source = builtins.fetchurl {
          url =
            "https://raw.githubusercontent.com/alvivi/dotfiles/master/wallpapers/mad_dog_jones_004.png";
          sha256 = "18hyfhsl879kr0ci5rwkvvl03jmd8b8fvncd1v0arqid1drwnlnk";
        };
      };
      "Pictures/Wallpapers/mad_dog_jones_005.png" = {
        source = builtins.fetchurl {
          url =
            "https://raw.githubusercontent.com/alvivi/dotfiles/master/wallpapers/mad_dog_jones_005.png";
          sha256 = "0jjjaf01zr1mph7s5bibjnn8ibjhf4bqjakfn8harb4mhak02n2p";
        };
      };
      ".local/share/applications/neovim.desktop" = {
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
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = { text-scaling-factor = 1.25; };

    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };

    "org/gnome/desktop/input-sources" = {
      sources = lib.hm.gvariant.mkValue [
        (lib.hm.gvariant.mkTuple [
          (lib.hm.gvariant.mkString "xkb")
          (lib.hm.gvariant.mkString "es")
        ])

        (lib.hm.gvariant.mkTuple [
          (lib.hm.gvariant.mkString "xkb")
          (lib.hm.gvariant.mkString "us")
        ])
      ];
    };
  };

  # xsession = {
  #   enable = true;
  # };

  # services = {
  #   clipmenu = { enable = true; };

  #   random-background = {
  #     enable = true;
  #     enableXinerama = true;
  #     imageDirectory = "%h/Pictures/Wallpapers";
  #   };

  #   redshift = {
  #     enable = true;
  #     brightness = {
  #       day = "1";
  #       night = "0.8";
  #     };
  #     provider = "geoclue2";
  #   };
  # };

  programs = {
    firefox = {
      enable = true;
      enableGnomeExtensions = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        sidebery
        ublock-origin
        vimium
      ];
      profiles.alvivi = {
        settings = {
          "layout.css.devPixelsPerPx" = "1.25";
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
      delta.enable = true;
      lfs.enable = true;
      userEmail = "alvivi@gmail.com";
      userName = "Alvaro Vilanova Vidal";
      signing = {
        key = "9A8F06C7265E82FB";
        signByDefault = true;
      };
      extraConfig = {
        "difftool \"nvr\"" = { cmd = "nvr -s -d $LOCAL $REMOTE"; };
        "mergetool \"nvr\"" = {
          cmd =
            "nvr -s -d $LOCAL $BASE $REMOTE $MERGED -c 'wincmd J | wincmd ='";
        };
        diff = { tool = "nvr"; };
        merge = {
          tool = "nvr";
          conflictstyle = "diff3";
        };
        mergetool = { prompt = false; };
        pull.ff = "only";
      };
      ignores = [ ".elixir_ls" ];
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
      plugins = let
        vim-mix-format = pkgs.vimUtils.buildVimPlugin {
          name = "vim-mix-format";
          src = pkgs.fetchFromGitHub {
            owner = "mhinz";
            repo = "vim-mix-format";
            rev = "cbb63e65a423ea63444a5d1b41e51d1fcec5f962";
            sha256 = "037fbmcj9dfj89jd2xa1xv55baqvws85xpjmypgr3kx7y183l0b7";
          };
        };
      in with pkgs.vimPlugins; [
        ale
        emmet-vim
        fzf-vim
        nerdcommenter
        undotree
        vim-airline
        vim-airline-themes
        vim-devicons
        vim-easymotion
        vim-elixir
        vim-fugitive
        vim-gitgutter
        vim-mix-format
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
          "git branch --all | peco | sed 's/remotes\\/origin\\///g' | xargs git checkout";
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
