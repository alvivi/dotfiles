{ pkgs, ... }: {
  home = {
    file.".tigrc" = {
      text = ''
        # General colors
        color default                       253         233
        color cursor                        default     237
        color status                        250         235
        color title-focus                   default     238
        color title-blur                    default     238
        color delimiter                     241         default
        color header                        186         236             bold
        color section                       186         default
        color line-number                   102         235
        color id                            208         default
        color date                          67          default
        color author                        135         default
        color mode                          166         default
        color overflow                      241         default
        color directory                     69          default
        color file                          default     default
        color file-size                     default     default
        color grep.file                     166         234

        # Main view colors
        color graph-commit                  161         default
        color main-head                     144         default         bold
        color main-remote                   81          default
        color main-tracked                  222         default
        color main-tag                      197         default
        color main-local-tag                161         default
        color main-ref                      144         default

        # Palette colors
        color palette-0                     239         default
        color palette-1                     242         default
        color palette-2                     245         default
        color palette-3                     248         default
        color palette-4                     237         default
        color palette-5                     240         default
        color palette-6                     243         default
        color palette-7                     246         default
        color palette-8                     249         default
        color palette-9                     238         default
        color palette-10                    241         default
        color palette-11                    244         default
        color palette-12                    247         default
        color palette-13                    236         default

        # Status view colors
        color status.header                 186         236             bold
        color status.section                186         default
        color stat-staged                   green       default
        color stat-unstaged                 red         default
        color stat-untracked                red         default

        # Help view colors
        color help.header                   186         236             bold
        color help.section                  186         default
        color help-group                    69          default
        color help-action                   166         default

        # Diff view colors
        color "commit "                     208         234
        color "Refs: "                      197         234
        color "Author: "                    135         default
        color "AuthorDate: "                67          default
        color "Commit: "                    141         default
        color "CommitDate: "                67          default
        color "Merge: "                     161         default
        color "---"                         67          default
        color diff-index                    67          default
        color diff-stat                     166         234
        color diff-add-highlight            10          22
        color diff-del-highlight            9           52

        # Signature colors
        color "gpg: "                       23          default
        color "Primary key fingerprint: "   23          default
      '';
    };
    packages = with pkgs; [ gitAndTools.gh tig ];
  };

  programs.git = {
    enable = true;
    delta.enable = true;
    extraConfig = {
      "difftool \"nvr\"" = { cmd = "nvr -s -d $LOCAL $REMOTE"; };
      "mergetool \"nvr\"" = {
        cmd = "nvr -s -d $LOCAL $BASE $REMOTE $MERGED -c 'wincmd J | wincmd ='";
      };
      delta.features = "line-numbers decorations";
      diff = { tool = "nvr"; };
      init = { defaultBranch = "main"; };
      merge = {
        tool = "nvr";
        conflictstyle = "diff3";
      };
      mergetool = { prompt = false; };
      pull.ff = "only";
    };
    ignores = [
      ".direnv"
      ".elixir_ls"
      ".envrc"
      "cover"
      "deps"
      "node_modules"
      "result"
    ];
    lfs.enable = true;
    signing = {
      key = "9A8F06C7265E82FB";
      signByDefault = true;
    };
    userEmail = "alvivi@gmail.com";
    userName = "Alvaro Vilanova Vidal";
  };
}