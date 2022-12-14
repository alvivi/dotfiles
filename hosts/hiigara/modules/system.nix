{ pkgs, ... }: {
  environment = with pkgs; {
    shells = [ bashInteractive zsh ];

    systemPackages = [
      curl
      git
      vim
    ];
  };

  networking.hostName = "hiigara";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    openssh.enable = true;
  };

  time.timeZone = "Europe/Madrid";

  users = {
    mutableUsers = false;

    users.alvivi = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$qbF5X05.6SVHvV5HM/R9F0$/tuDQyUNpl1odfIjTcrn.W9UeOgxxPQxF9MiZuU8NB2";
      extraGroups = [ "wheel" ];
    };
  };

  system.stateVersion = "22.11";

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.dnsname.enable = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
    };
  };
}
