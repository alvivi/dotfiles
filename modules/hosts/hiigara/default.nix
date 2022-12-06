{ pkgs, ... }: {
  imports = [
    ./system.nix
    ../keyboard.nix
  ];

  environment = with pkgs; {
    shells = [ bashInteractive zsh ];
    systemPackages = [ vim ];
  };

  networking.hostName = "hiigara";

  nix = {
    extraOptions = '' 
      experimental-features = nix-command flakes 
    '';
  };

  nixpkgs.config.allowUnfree = true;

  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    enable = true;
  };

  system.stateVersion = "22.05";

  time.timeZone = "Europe/Madrid";

  users = {
    defaultUserShell = pkgs.zsh;
    users.alvivi = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.dnsname.enable = true;
    };
  };
}
