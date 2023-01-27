{ pkgs, ... }: {
  home = {
    file.".tigrc" = { source = ./tig.theme; };
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
      "flake.lock"
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

