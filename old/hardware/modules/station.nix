{ config, ... }: {
  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" "wl" ];
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.broadcom_sta
    config.boot.kernelPackages.nvidia_x11
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      version = 2;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  hardware.video.hidpi.enable = true;
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    displayManager.gdm = {
      wayland = false;
      nvidiaWayland = false;
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
}
