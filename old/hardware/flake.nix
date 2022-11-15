{
  description = "Alvivi's physical machines";

  inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";

  outputs = { self, nixos-hardware }: {
    nixosModules = {
      kantoxLaptop = {
        imports = [
          nixos-hardware.nixosModules.dell-xps-13-9380
          ./modules/kantox-laptop.nix
        ];
      };
      station = import ./modules/station.nix;
      virtual = import ./modules/virtual.nix;
    };
  };
}
