{ config, lib, ... }: {
  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
    pulseaudio.enable = false;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
