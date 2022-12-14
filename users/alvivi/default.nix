{ homeage, home-manager, nixpkgs, ... }: home-manager.lib.homeManagerConfiguration rec {
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  modules = [
    homeage.homeManagerModules.homeage
    ./modules
  ];
}
