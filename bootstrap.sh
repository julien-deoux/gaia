#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ ! -d /opt/homebrew ]
then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "An existing Homebrew was already found"
fi

if [ -z "${HOMEBREW_PREFIX}" ]
then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew already in PATH"
fi

if [ ! -f /opt/homebrew/bin/fish ]
then
  echo "Installing fish"
  brew install fish
else
  echo "Fish is already installed"
fi

if [ ! $SHELL = /opt/homebrew/bin/fish ]
then
  echo "Setting fish as your default shell"
  chsh -s /opt/homebrew/bin/fish
else
  echo "Fish is already your default shell"
fi

brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
brew install --cask wezterm
brew install rustup-init neovim ripgrep fzf fd bat cormacrelf/tap/dark-notify

if [ ! -e ~/.config/wezterm ]
then
  ln -s $SCRIPT_DIR/wezterm ~/.config/wezterm
fi

if [ ! -d ~/.config/home-manager ]
then
  ln -s $SCRIPT_DIR/home-manager ~/.config/home-manager
fi

if [ ! -d ~/.config/nvim ]
then
  ln -s $SCRIPT_DIR/nvim ~/.config/nvim
fi

if [ ! -d ~/.local/bin ]
then
    mkdir -p ~/.local/bin
fi

echo "Your system is ready! 👌"
echo "Restart your terminal or run 'fish' to start having fun."
