{ ... }: {
  boot = {
    extraModulePackages = [ ];
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/abb9ca1c-3c0b-4704-9f89-9c9e676a40b0";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/04A1-FF5D";
      fsType = "vfat";
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/e6643b11-9b9f-4393-8e0d-bdc25f51f9ea"; }
  ];
}
