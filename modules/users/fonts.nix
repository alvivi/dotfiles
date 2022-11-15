{ pkgs, ... }: {
  # NOTE: Run "fc-cache -rf" to update fonts cache.

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
    montserrat
  ];

  xresources.properties = {
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
