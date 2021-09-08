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
            ./modules/git.nix
            ./modules/browser.nix
            ./modules/editor
            ./modules/terminal.nix
          ];

          nixpkgs = {
            config.allowUnfree = true;
            overlays = [
              nur.overlay
              (self: super: {
                catppuccino-nvim = with pkgs;
                  vimUtils.buildVimPlugin {
                    name = "catppuccino-nvim";
                    src = fetchFromGitHub {
                      owner = "Pocco81";
                      repo = "Catppuccino.nvim";
                      rev = "485ddc2841f1c3db954632f722430a746b3659a8";
                      sha256 =
                        "14rlqj013k5594xy35bk7cq92y09yn23yvr3iam91ix00rw1id4i";
                    };
                  };
              })
            ];
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
              nix-direnv = {
                enable = true;
                enableFlakes = true;
              };
            };
            home-manager.enable = true;
            gpg.enable = true;
          };

          services.gpg-agent.enable = true;
        };
      };
  };
}
