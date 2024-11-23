#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ ! -d /nix ]
then
  echo "Installing Nix"
  sh <(curl -L https://nixos.org/nix/install) --daemon
else
  echo "An existing Nix was already found"
fi

mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf

nix run home-manager -- switch --flake $SCRIPT_DIR/home-manager#julien-linux

echo "Your system is ready! 👌"
echo "Restart your computer to start having fun."
