#! /usr/bin/env bash

mkdir -p "${HOME}/.local/bin"
PATH="${PATH}:${HOME}/.local/bin"

# surrealdb cli
bash <(curl --proto '=https' --tlsv1.2 -sSf https://install.surrealdb.com) --version v1.3.1
mv ${HOME}/.surrealdb/surreal ${HOME}/.local/bin/surreal

# mkdir -p $HOME/.config/lvim &&
# ln -sf $PWD/.devcontainer/lvim-config.lua $HOME/.config/lvim/config.lua &&
# set +x

exit 0
