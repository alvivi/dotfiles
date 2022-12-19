{ config, lib, pkgs, ... }: {

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      systemd.enable = true;
    };

    kernelModules = [ "kvm-amd" "wl" ];
    kernelParams = [ "quiet" ];

    extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

    loader = {
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

    plymouth = {
      enable = true;
      theme = "breeze";
    };

    supportedFilesystems = [ "ntfs" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  swapDevices =
    [{ device = "/dev/disk/by-label/swap"; }];
}


