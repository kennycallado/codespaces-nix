{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-23.11.tar.gz") { } }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # needed by nix
    nixpkgs-fmt
    rnix-lsp

    # development tools
    #lunarvim
    ripgrep
    neovim
    curl
    git
    gcc
  ];
}
