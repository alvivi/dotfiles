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
    settings = let colorscheme = import ./colorscheme.nix;
    in {
      disable_ligatures = "cursor";
      sync_to_monitor = "yes";
      mouse_hide_wait = "-1";

      linux_display_server = "x11";

      foreground = colorscheme.fg-primary;
      background = colorscheme.bg-primary;
      selection_foreground = colorscheme.fg-primary-bright;
      selection_background = colorscheme.bg-primary-bright;

      color0 = colorscheme.black;
      color1 = colorscheme.red;
      color2 = colorscheme.green;
      color3 = colorscheme.yellow;
      color4 = colorscheme.blue;
      color5 = colorscheme.magenta;
      color6 = colorscheme.cyan;
      color7 = colorscheme.white;

      color8 = colorscheme.bright-black;
      color9 = colorscheme.bright-red;
      color10 = colorscheme.bright-green;
      color11 = colorscheme.bright-yellow;
      color12 = colorscheme.bright-blue;
      color13 = colorscheme.bright-magenta;
      color14 = colorscheme.bright-cyan;
      color15 = colorscheme.bright-white;
    };
    keybindings = {
      "ctrl+q" = "no_op";
      "ctrl+w" = "no_op";
      "kitty_mod+q" = "no_op";
      "kitty_mod+w" = "no_op";
    };
  };
}
