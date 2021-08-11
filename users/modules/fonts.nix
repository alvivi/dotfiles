{ pkgs, ... }: {
  # NOTE: Run "fc-cache -rf" to update fonts cache.

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
    montserrat
  ];

  xresources.properties = let colorscheme = import ./colorscheme.nix;
  in {
    "*.foreground" = colorscheme.fg-primary;
    "*.background" = colorscheme.bg-primary;

    "*.color0" = colorscheme.black;
    "*.color1" = colorscheme.red;
    "*.color2" = colorscheme.green;
    "*.color3" = colorscheme.yellow;
    "*.color4" = colorscheme.blue;
    "*.color5" = colorscheme.magenta;
    "*.color6" = colorscheme.cyan;
    "*.color7" = colorscheme.white;

    "*.color8" = colorscheme.bright-black;
    "*.color9" = colorscheme.bright-red;
    "*.color10" = colorscheme.bright-green;
    "*.color11" = colorscheme.bright-yellow;
    "*.color12" = colorscheme.bright-blue;
    "*.color13" = colorscheme.bright-magenta;
    "*.color14" = colorscheme.bright-cyan;
    "*.color15" = colorscheme.bright-white;

    "XTerm*font" = "xft:Iosevka Term";
    "*.internalBorder" = 4;

    "Xft.antialias" = true;
    "Xft.hinting" = true;
    "Xft.rgba" = "rgb";
    "Xft.autohint" = false;
    "Xft.hintstyle" = "hintslight";
    "Xft.lcdfilter" = "lcddefault";
  };
}
