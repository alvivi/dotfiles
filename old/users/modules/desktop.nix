{ pkgs, lib, ... }: {
  gtk = {
    enable = true;
    font.name = "Montserrat";
    theme = {
      name = "Catppuccin-magenta";
      package = pkgs.catppuccin-magenta-gtk;
    };
  };

  nixpkgs = {
    overlays = [
      (self: super: {
        catppuccin-magenta-gtk = pkgs.stdenv.mkDerivation rec {
          pname = "catppuccin-magenta-gtk";
          version = "1.0.0";

          src = pkgs.fetchzip {
            url =
              "https://github.com/catppuccin/gtk/releases/download/v.1.0.0/Catppuccin-magenta.tar.gz";
            sha256 = "106v4fqylx2ck1fhg0j1h80p8fczma4x12zw91cnsm9npa486rqy";
          };

          propagatedUserEnvPkgs = with pkgs; [
            gnome.gnome-themes-extra
            gtk-engine-murrine
          ];

          installPhase = ''
            mkdir -p $out/share/themes/Catppuccin-magenta
            ls | xargs mv -t $out/share/themes/Catppuccin-magenta
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
