{ config, lib, pkgs, ... }: {
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  networking.useDHCP = lib.mkDefault true;

  hardware =
    {
      cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      enableAllFirmware = true;

      nvidia = {
        modesetting.enable = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        powerManagement.enable = true;
      };

      pulseaudio.enable = true;

      video.hidpi.enable = lib.mkDefault true;
    };

  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];

  sound.enable = lib.mkDefault true;
}
