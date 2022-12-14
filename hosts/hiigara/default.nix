{ agenix, home-manager, nixpkgs, ... }@inputs: nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";

  modules =
    [
      ./modules/hardware.nix
      ./modules/boot.nix
      ./modules/system.nix
      ../shared/keyboard.nix
      agenix.nixosModule

      {
        environment.systemPackages = [
          agenix.defaultPackage.${system}
          home-manager.packages.${system}.home-manager
        ];
      }
    ];
}
