{
  description = "Alvivi's systems configuration";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    hardware.url = "path:hardware";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    users.url = "path:users";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    users.inputs.home-manager.follows = "home-manager";
    users.inputs.nixpkgs.follows = "nixpkgs";
    users.inputs.nur.follows = "nur";
  };

  outputs = { hardware, nixpkgs, self, users, ... }@inputs: {
    homeConfigurations = users.outputs.homeConfigurations;

    nixosConfigurations.nixStation = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        hardware.nixosModules.station
        ./modules/common.nix
        inputs.home-manager.nixosModules.home-manager
        ./modules/keyboard.nix

        ({ pkgs, ... }: {
          networking.hostName = "nix-station";
          networking.useDHCP = false;
          networking.interfaces.enp6s0.useDHCP = true;

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          services.xserver.enable = true;
          services.xserver.displayManager.gdm.enable = true;
          services.xserver.desktopManager.gnome.enable = true;

          users = {
            defaultUserShell = pkgs.zsh;

            users.alvivi = {
              isNormalUser = true;
              extraGroups = [ "wheel" ];
            };
          };

          environment = {
            shells = [ pkgs.bashInteractive pkgs.zsh ];
            systemPackages = [
              inputs.home-manager.packages.x86_64-linux.home-manager
              pkgs.vim
            ];
          };
        })
      ];
    };

    nixosConfigurations.kantoxLaptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        hardware.nixosModules.kantoxLaptop
        ./modules/common.nix
        inputs.home-manager.nixosModules.home-manager
        ./modules/keyboard.nix

        ({ pkgs, ... }: {
          networking.hostName = "alvivi-kantox-laptop";
          networking.networkmanager.enable = true;
          networking.useDHCP = false;

          systemd.services.NetworkManager-wait-online.enable = false;

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          services.xserver.enable = true;
          services.xserver.displayManager.gdm.enable = true;
          services.xserver.desktopManager.gnome.enable = true;

          services.fwupd.enable = true;

          users = {
            defaultUserShell = pkgs.zsh;

            users.alvivi = {
              isNormalUser = true;
              extraGroups = [ "wheel" ];
            };
          };

          environment = {
            shells = [ pkgs.bashInteractive pkgs.zsh ];
            systemPackages = [
              inputs.home-manager.packages.x86_64-linux.home-manager
              pkgs.vim
            ];
          };
        })
      ];
    };

    checks = builtins.listToAttrs (map (system: {
      name = system;
      value = let pkgs = nixpkgs.outputs.legacyPackages."${system}";
      in {
        nixfmt-check = pkgs.runCommand "nixfmt-alivi-config" { } ''
          ${pkgs.nixfmt}/bin/nixfmt --check \
            $(find ${self} -type f -name '*.nix')
          mkdir $out
        '';
      };
    }) inputs.flake-utils.lib.defaultSystems);
  };
}
