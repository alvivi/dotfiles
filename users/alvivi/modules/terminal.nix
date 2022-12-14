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
    extraConfig =
      let
        catppuccin-kitty = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "kitty";
          rev = "2433655cad4a7ff69b331f79eb98942d97659d5f";
          sha256 = "1b8082vrfnsavs6p6x4ibld8ylqv7zaxaanys3ibwb483rf1hvjn";
        };
      in
      builtins.readFile "${catppuccin-kitty}/catppuccin.conf";
    settings = {
      disable_ligatures = "cursor";
      font_size = 16;
      hide_window_decorations = true;
      mouse_hide_wait = -1;
      sync_to_monitor = true;
    };
    keybindings = {
      "ctrl+q" = "no_op";
      "ctrl+w" = "no_op";
      "kitty_mod+q" = "no_op";
      "kitty_mod+w" = "no_op";
    };
  };
}

