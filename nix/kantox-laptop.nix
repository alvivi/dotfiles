# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: rec {
      nur = import (builtins.fetchTarball {
        url =
          "https://github.com/nix-community/NUR/archive/de27c87a57d0920e63fafab9f08d9c33aecf2e06.tar.gz";
        sha256 = "0vg9xg0j8c0p6ng1yk3x53z4nfn647jnfn012r06ljzhny560r8d";
      }) { inherit pkgs; };
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 1;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Enable HiDPI display defaults
  hardware.video.hidpi.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.hostName = "alvivi-kantox-laptop"; # Define your hostname.
  networking.useDHCP = false;
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;
  # networking.interfaces.enp0s20f0u1u4.useDHCP = true;
  # networking.interfaces.wlp2s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the GNOME 3 Desktop Environment.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.gnome3.chrome-gnome-shell.enable = true;

  # Enable Intel graphic drivers
  services.xserver.videoDrivers = [ "intel" ];

  # Configure keymap in X11
  # If the keyword mapping is not working, try to reset the keyboard
  # configuration using:
  #   gsettings reset org.gnome.desktop.input-sources xkb-options
  #   gsettings reset org.gnome.desktop.input-sources sources
  services.xserver.layout = "es";
  services.xserver.xkbOptions = "eurosign:e,ctrl:nocaps";
  console.useXkbConfig = false;
  services.interception-tools.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alvivi = {
    isNormalUser = true;
    extraGroups = [ "docker" "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # chromium
    curl
    vim
    wget
  ];

  # Enable Docker
  virtualisation.docker.enable = true;

  # Enable GnuPG Agent
  programs.gnupg.agent.enable = true;

  # Enable Geo-Location
  location.provider = "geoclue2";
  services.geoclue2.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
