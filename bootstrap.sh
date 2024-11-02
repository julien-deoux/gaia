#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ ! -d /nix ]
then
  echo "Installing Nix"
  sh <(curl -L https://nixos.org/nix/install)
else
  echo "An existing Nix was already found"
fi

nix run nix-darwin --experimental-features 'nix-command flakes' -- switch --flake $SCRIPT_DIR/nix-darwin
nix run home-manager --experimental-features 'nix-command flakes' -- switch --flake $SCRIPT_DIR/home-manager

echo "Your system is ready! 👌"
echo "Restart your computer to start having fun."
