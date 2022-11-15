{ config, pkgs, ... }:
let
  nur = import
    (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/NUR/archive/b0a35357871c473c5cd1de2a0a66abdcef4f52c7.tar.gz";
        sha256 = "0xzi290ckwpa7vsrf74s23vmk1va8hibmyrpnjwwhz9wsxxg1ryl";
      })
    { nurpkgs = pkgs; pkgs = pkgs; };
in
{
  programs = {
    firefox = {
      enable = true;
      extensions = with nur.repos.rycee.firefox-addons; [
        sidebery
        tridactyl
        ublock-origin
      ];
      package = pkgs.firefox.override {
        cfg = {
          enableGnomeExtensions = true;
          enableTridactylNative = true;
        };
      };
      profiles.alvivi = {
        settings = {
          "layout.css.devPixelsPerPx" = "1.25";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          #titlebar { visibility: collapse !important; }
        '';
      };
    };
  };
}
