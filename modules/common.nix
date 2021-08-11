{ pkgs, ... }: {
  system.stateVersion = "21.05";

  nix.package = pkgs.nixUnstable;
  nix.extraOptions = "experimental-features = nix-command flakes";
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 14d";
  nix.trustedUsers = [ "root" "@wheel" ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Madrid";

  security.sudo.enable = true;
}
