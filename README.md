# Alvivi's Dotfiles

My own personal [dotfiles](https://wiki.archlinux.org/title/Dotfiles) using
[Nix](https://nixos.org) [Flakes](https://nixos.wiki/wiki/Flakes).

## Hosts (Machines)

```
nixos-rebuild switch --flake ".#HOSTNAME"
```

## Users

```
home-manager switch --flake ".#USERNAME"
```

## Development Shells

This flake provides several development shells which I use regularly. In
combination with [nix-direnv](https://github.com/nix-community/nix-direnv)
allows me to setup per project dependencies without messing project
repositories.

Development shells can be stacked. For example, the following `.envrc` enables
[Elixir](https://elixir-lang.org/) development, with _Elixir_ and
[Erlang](https://www.erlang.org) versions pinned, plus
[Wallaby](https://github.com/elixir-wallaby/wallaby) runtime dependencies for
E2E Web testing:

```
use flake github:alvivi/dotfiles#elixir_1_13_4_erlang_24_3_4
use flake github:alvivi/dotfiles#elixir_wallaby
```
