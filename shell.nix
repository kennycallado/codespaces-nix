{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-23.11-small.tar.gz") { } }:

pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    # needed by nix
    nixpkgs-fmt
    # rnix-lsp # error: Package ‘nix-2.15.3’ in /nix/store/4dj2fbzyykakm4x4d0v855r6n5ss9hf9-source/pkgs/tools/package-management/nix/common.nix:250 is marked as insecure, refusing to evaluate.

    # development tools
    neovim
    curl
    git
    gcc

    # lunarvim
    lunarvim
    html-tidy # rest.nvim
    ripgrep
    jq
    fd
  ];
}
