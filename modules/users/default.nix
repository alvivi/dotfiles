{ pkgs, ... }: {
  home = {
    username = "alvivi";
    homeDirectory = "/home/alvivi";
    stateVersion = "22.05";
  };

  nixpkgs.config = {
    allowUnfree = true;

    # BUG: https://discourse.nixos.org/t/nixpkgs-unfree-configs-not-respected/20546/9
    allowUnfreePredicate = (pkg: true);
  };

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
    packages = with pkgs; [
      # awscli2
      # docker
      # docker-compose
      # nodejs
      # openvpn
      # shutter
      # ssm-session-manager-plugin
      curl
      gcc
      jq
      rnix-lsp
      slack
      spotify
      tree-sitter
      unzip
      xclip
      zip
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
