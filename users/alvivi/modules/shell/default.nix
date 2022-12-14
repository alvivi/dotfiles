{ pkgs, ... }: {
  home.packages = with pkgs; [ cloc inotify-tools peco ];

  programs.bat.enable = true;

  programs.fzf.enable = true;

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    history.extended = true;

    prezto = {
      enable = true;
      prompt.theme = "pure";
    };

    initExtra = builtins.readFile ./init.zsh;
    initExtraBeforeCompInit = builtins.readFile ./functions.zsh;

    sessionVariables = { ERL_AFLAGS = "-kernel shell_history enabled"; };

    shellAliases = import ./aliases.nix;
  };

  home.file.".config/peco/config.json" = {
    text = ''
      {
         "Style": {
             "Basic": ["on_default", "default"],
             "SavedSelection": ["bold", "on_yellow", "black"],
             "Selected": ["underline", "on_cyan", "black"],
             "Query": ["yellow", "bold"],
             "Matched": ["red", "on_blue"]
         },
         "Use256Color": true
      }
    '';
  };
}

