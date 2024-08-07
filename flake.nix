{
  description = "Alvivi's systems configuration";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { flake-utils, nixpkgs, ... }@inputs: {
    formatter = flake-utils.lib.eachDefaultSystemMap (system: nixpkgs.legacyPackages.${system}.nixpkgs-fmt);
    homeConfigurations = { alvivi = import ./users/alvivi inputs; };
    nixosConfigurations = {
      hiigara = import ./hosts/hiigara inputs;
      kantoxLaptop = import ./hosts/kantoxLaptop inputs;
    };
  };
}
