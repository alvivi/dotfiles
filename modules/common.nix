{ pkgs, ... }: {
  system.stateVersion = "21.05";

  nix = {
    package = pkgs.nixUnstable;
    gc = { 
      automatic = true;
      options = "--delete-older-than 14d";
    };
    trustedUsers = [ "root" "@wheel" ];
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
