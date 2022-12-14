{ config, pkgs, ... }: rec {
  imports = [
    ./browser.nix
    ./desktop.nix
    ./editor
    ./fonts.nix
    ./git
    ./shell
    ./terminal.nix
  ];

  home = {
    username = "alvivi";
    homeDirectory = "/home/alvivi";
    stateVersion = "22.11";

    # FIX: https://nixos.wiki/wiki/Slack
    sessionVariables.NIXOS_OZONE_WL = "1";

    packages = with pkgs; [
      (spotify.override { deviceScaleFactor = 1.5; })
      awscli2
      curl
      gcc
      gimp
      jq
      podman-compose
      rnix-lsp
      slack
      ssm-session-manager-plugin
      trash-cli
      tree-sitter
      unzip
      xclip
      zip
    ];
  };

  homeage = {
    identityPaths = [ "~/.ssh/id_ed25519" ];
    installationType = "activation";

    file.aws_config = {
      source = ../../../secrets/aws_config.age;
      symlinks = [ "${home.homeDirectory}/.aws/config" ];
    };
  };

  nixpkgs = {
    config = {
      # BUG: https://discourse.nixos.org/t/nixpkgs-unfree-configs-not-respected/20546/9
      allowUnfree = true;
      allowUnfreePredicate = (pkg: true);
    };

    overlays = [
      (import ../overlays/slack.nix)
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
}
