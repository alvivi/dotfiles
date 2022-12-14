{ pkgs, lib, ... }: {
  gtk = {
    enable = true;
    font.name = "Montserrat";
    theme = {
      name = "Catppuccin-Mocha-Lavender";
      package = pkgs.catppuccin-mocha-peach-gtk;
    };
  };

  nixpkgs = {
    overlays = [
      (self: super: {
        catppuccin-mocha-peach-gtk = pkgs.stdenv.mkDerivation rec {
          pname = "catppuccin-mocha-peach-gtk";
          version = "0.2.7";

          src = pkgs.fetchzip {
            url = "https://github.com/catppuccin/gtk/releases/download/v-0.2.7/Catppuccin-Mocha-Lavender.zip";
            sha256 = "07x560nz0y1pf9896vxnyxlqplp2kxbmjq6pdsfi2j4l6ymyvx54";
            stripRoot = false;
          };

          propagatedUserEnvPkgs = with pkgs; [
            gnome.gnome-themes-extra
            gtk-engine-murrine
          ];

          installPhase = ''
            mkdir -p $out/share/themes/Catppuccin-Mocha-Lavender
            cp -a Catppuccin-Mocha-Lavender/. $out/share/themes/Catppuccin-Mocha-Lavender
            cp -af Catppuccin-Mocha-Lavender-xhdpi/. $out/share/themes/Catppuccin-Mocha-Lavender
          '';
        };
      })
    ];
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
