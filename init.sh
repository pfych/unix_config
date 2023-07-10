#!/bin/bash

echo "Setting up env stuff"

# Set up vim packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

vim +PackerInstall
