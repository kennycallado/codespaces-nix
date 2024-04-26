{
  description = "Development environment for the project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11-small";
    systems.url = "github:nix-systems/default";
    # surreal.url = "github:surrealdb/surrealdb/refs/tags/v1.3.1";
    flake-compat.url = "github:nix-community/flake-compat";
  };

  outputs = { nixpkgs , systems, ... }:
  let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {

    devShells = eachSystem (system: {
      default =
      let
        pkgs = import nixpkgs { inherit system; };
      in pkgs.mkShell {
        packages = with pkgs; [
          # db cli
          # surrealdb

          # php cli
          php82
          php82Packages.composer
          php82Extensions.xml
          php82Extensions.curl
          php82Extensions.pcov
          php82Extensions.mbstring

          # alternative editors
          neovim
          lunarvim

          # not needed but can be useful
          nodejs_18
          nodePackages.pnpm
          # (yarn.override { nodejs = nodejs_18; })
        ];

        shellHook = ''
          echo "ready to rock! 🚀"
          echo 
          echo "=================="
          echo `${pkgs.php82Packages.composer}/bin/composer --version`
          echo "=================="
          echo -e "node:"
          echo `${pkgs.nodejs_18}/bin/node --version`
          echo "=================="
          echo "lunarvim:"
          echo `${pkgs.lunarvim}/bin/lvim --version`
          echo 
          if [ -f $HOME/.config/lvim/config.lua ]; then
            echo "lunarvim already configured"
          else
            echo "Creating a symlink for lunarvim config"

            mkdir -p $HOME/.config/lvim &&
            ln -sf $PWD/.devcontainer/lvim-config.lua $HOME/.config/lvim/config.lua
          fi
          echo "=================="
        '';
      };
    });
  };
}
