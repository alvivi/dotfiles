{ pkgs, lib, ... }: {
  gtk = {
    enable = true;
    font.name = "Montserrat";
    theme = {
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        variant = "mocha";
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      text-scaling-factor = 1.25;
      cursor-size = 30;
    };

    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
      workspaces-only-on-primary = true;

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
}

