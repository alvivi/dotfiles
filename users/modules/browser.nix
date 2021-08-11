{ pkgs, ... }: {
  programs = {
    firefox = {
      enable = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
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
