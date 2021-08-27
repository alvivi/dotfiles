{ pkgs, ... }: {
  home = {
    file.".local/share/applications/neovim.desktop" = {
      text = ''
        [Desktop Entry]
        Encoding=UTF-8
        Name=NeoVim
        Exec=kitty zsh -c "nvim"
        Icon=nvim
        Type=Application
        Categories=Development
      '';
    };
  };

  programs.kitty = {
    enable = true;
    font.name = "Iosevka Term";
    extraConfig = builtins.readFile
      "${pkgs.catppuccino-nvim}/share/vim-plugins/catppuccino-nvim/extra/kitty/catppuccino.conf";
    settings = let colorscheme = import ./colorscheme.nix;
    in {
      disable_ligatures = "cursor";
      sync_to_monitor = "yes";
      mouse_hide_wait = "-1";
      linux_display_server = "x11";
    };
    keybindings = {
      "ctrl+q" = "no_op";
      "ctrl+w" = "no_op";
      "kitty_mod+q" = "no_op";
      "kitty_mod+w" = "no_op";
    };
  };
}
