{ pkgs, ... }: {
  system.stateVersion = "21.05";

  nix = {
    package = pkgs.nix_2_4;
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
    settings = { trusted-users = [ "root" "@wheel" ]; };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-derivations = true
      keep-outputs = true
    '';
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Madrid";

  security.sudo.enable = true;
}