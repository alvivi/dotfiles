{ home-manager, nixos-hardware, nixpkgs, ... }@inputs: nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";

  modules = [
    nixos-hardware.nixosModules.dell-xps-13-9380
    ./modules/hardware.nix
    ./modules/boot.nix
    ./modules/system.nix

    {
      environment.systemPackages = [
        home-manager.packages.${system}.home-manager
      ];
    }
  ];
}
