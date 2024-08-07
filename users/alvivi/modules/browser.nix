{ config, pkgs, ... }:
let
  nur = import
    (builtins.fetchTarball {
      url = "https://github.com/nix-community/NUR/archive/606c868d0b4adf9c186043723f7f3c11ee147f76.tar.gz";
      sha256 = "06j6xgna3mzbq1nk52h3syk31438wx5j4pqzdjd37gwm0gc515zd";
    })
    { nurpkgs = pkgs; pkgs = pkgs; };
in
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox.override {
        cfg = {
          enableGnomeExtensions = true;
          nativeMessagingHosts.packages = [ pkgs.tridactyl-native ];
        };
      };
      profiles.alvivi = {
        extensions = with nur.repos.rycee.firefox-addons; [
          sidebery
          tridactyl
          ublock-origin
        ];
        settings = {
          "layout.css.devPixelsPerPx" = "1.5";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          #titlebar { visibility: collapse !important; }
        '';
      };
    };
  };
}
