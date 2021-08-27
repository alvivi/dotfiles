{ pkgs, ... }: {
  home.packages = with pkgs; [ gitAndTools.gh tig ];

  programs.git = {
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
  };
}
