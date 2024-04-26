{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-21.11.tar.gz") { } }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # needed by nix
    nixpkgs-fmt
    rnix-lsp

    # needed by me
    neovim
    curl
    git

    # go dev
    go
  ];
}
