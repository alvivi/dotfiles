{ config, lib, pkgs, ... }: {
  boot.initrd.availableKernelModules =
    [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

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
    };
    systemd-boot.enable = true;
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

  nixpkgs.config.allowUnfree = true;

  hardware.enableRedistributableFirmware = true;

  hardware.video.hidpi.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}

