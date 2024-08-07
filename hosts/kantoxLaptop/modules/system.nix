{ pkgs, ... }: {
  console.keyMap = "es";

  environment.systemPackages = with pkgs; [
    vim
  ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "es_ES.UTF-8";
      LC_IDENTIFICATION = "es_ES.UTF-8";
      LC_MEASUREMENT = "es_ES.UTF-8";
      LC_MONETARY = "es_ES.UTF-8";
      LC_NAME = "es_ES.UTF-8";
      LC_NUMERIC = "es_ES.UTF-8";
      LC_PAPER = "es_ES.UTF-8";
      LC_TELEPHONE = "es_ES.UTF-8";
      LC_TIME = "es_ES.UTF-8";
    };
  };

  networking = {
    firewall.enable = false;
    hostName = "alvivi-kantox-laptop";
    networkmanager.enable = true;
    # useDHCP = false;
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.allowUnfree = true;

  security.rtkit.enable = true;

  services = {
    mozillavpn.enable = true;

    pipewire = { enable = true; alsa.enable = true; alsa.support32Bit = true; pulse.enable = true; };

    printing.enable = true;

    xserver = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      enable = true;
      layout = "es";
      xkbVariant = "";
    };
  };

  sound.enable = true;

  system.stateVersion = "23.11";

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  time.timeZone = "Europe/Madrid";

  users.users.alvivi = {
    isNormalUser = true;
    description = "Alvaro";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };
}
