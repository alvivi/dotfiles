{
  description = "Alvivi's users configurations";

  inputs = {
    home-manager.url = "github:nix-comunity/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, nur, ... }@inputs: {
    homeConfigurations.nixos =
      inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/alvivi";
        username = "alvivi";
        stateVersion = "21.05";

        configuration = { pkgs, ... }: {
          imports = [
            ./modules/fonts.nix
            ./modules/desktop.nix
            ./modules/shell
            ./modules/git
            ./modules/browser.nix
            ./modules/editor
            ./modules/terminal.nix
          ];

          nixpkgs = {
            config.allowUnfree = true;
            overlays = [ nur.overlay ];
          };

          home = {
            packages = with pkgs; [
              awscli2
              docker
              docker-compose
              gcc
              jq
              nixfmt
              nodejs
              openvpn
              rnix-lsp
              shutter
              slack
              spotify
              ssm-session-manager-plugin
              tree-sitter
              unzip
              xclip
            ];
          };

          programs = {
            direnv = {
              enable = true;
              nix-direnv = { enable = true; };
            };
            home-manager.enable = true;
            gpg.enable = true;
          };

          services.gpg-agent.enable = true;
        };
      };
  };
}