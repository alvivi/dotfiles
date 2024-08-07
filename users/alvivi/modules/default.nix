{ pkgs, ... }: rec {
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
    stateVersion = "23.11";

    packages = with pkgs; [
      awscli2
      curl
      entr
      gcc
      gimp
      jq
      podman-compose
      putty
      rnix-lsp
      slack
      spotify
      ssm-session-manager-plugin
      tcptraceroute
      trash-cli
      tree-sitter
      unzip
      via
      wine
      xclip
      zip
    ];
  };

  nixpkgs = {
    config = {
      # BUG: https://discourse.nixos.org/t/nixpkgs-unfree-configs-not-respected/20546/9
      allowUnfree = true;
      allowUnfreePredicate = (pkg: true);
    };
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv = { enable = true; };
    };
    home-manager.enable = true;
    gpg.enable = true;
    ssh.enable = true;
  };

  services.gpg-agent.enable = true;
}
