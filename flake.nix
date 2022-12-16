{
  description = "Alvivi's systems configuration";

  inputs = {
    agenix.url = "github:ryantm/agenix";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    homeage.url = "github:jordanisaacs/homeage";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    agenix.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    homeage.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { flake-utils, nixpkgs, ... }@inputs: {
    devShells = import ./dev_shells inputs;
    formatter = flake-utils.lib.eachDefaultSystemMap (system: nixpkgs.legacyPackages.${system}.nixpkgs-fmt);
    homeConfigurations = { alvivi = import ./users/alvivi inputs; };
    nixosConfigurations = { hiigara = import ./hosts/hiigara inputs; };
  };
}
