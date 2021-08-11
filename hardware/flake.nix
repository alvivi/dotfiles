{
  description = "Alvivi's physical machines";

  outputs = { self }: {
    nixosModules = {
      virtual = import ./modules/virtual.nix;
      station = import ./modules/station.nix;
    };
  };
}

