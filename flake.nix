{
  description = "Alvivi's system configuration";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    sops-nix.url = "github:Mic92/sops-nix";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { flake-utils, nixpkgs, nur, sops-nix, ... }@inputs: {
    nixosConfigurations =
      let
        home-manager = { pkgs, ... }: {
          imports = [ inputs.home-manager.nixosModules.home-manager ];
          home-manager = { useGlobalPkgs = true; useUserPackages = true; };
          environment.systemPackages = [ inputs.home-manager.packages.${pkgs.system}.home-manager ];
        };
      in
      {
        hiigara =
          nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              nur.nixosModules.nur
              sops-nix.nixosModules.sops
              ./modules/hosts/hiigara
              home-manager
            ];
          };
      };

    homeConfigurations.alvivi =
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./modules/users ];
      };

    formatter =
      builtins.listToAttrs (map
        (system: {
          name = system;
          value = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
        })
        flake-utils.lib.defaultSystems);
  };
}
