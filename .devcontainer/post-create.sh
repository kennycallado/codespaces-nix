#! /usr/bin/env bash

mkdir -p $HOME/.config/lvim &&
ln -sf $PWD/.devcontainer/lvim-config.lua $HOME/.config/lvim/config.lua &&
set +x

exit 0
