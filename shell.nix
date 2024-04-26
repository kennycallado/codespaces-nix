{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-23.05.tar.gz") { } }:
# { pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # needed by nix
    nixpkgs-fmt
    rnix-lsp

    # development tools
    ripgrep
    neovim
    curl
    git
    gcc
  ];
}
