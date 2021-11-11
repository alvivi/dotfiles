{ pkgs, lib, ... }: {
  gtk = {
    enable = true;
    font.name = "Montserrat";
    theme.name = "Adwaita-dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      text-scaling-factor = 1.6;
      cursor-size = 32;
    };

    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
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
