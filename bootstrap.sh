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
brew install starship rustup-init neovim ripgrep tmux fzf fd bat

if [ ! -e ~/.config/fish ]
then
  ln -s $SCRIPT_DIR/fish ~/.config/fish
fi

if [ ! -e ~/.config/kitty ]
then
  ln -s $SCRIPT_DIR/kitty ~/.config/kitty
fi

if [ ! -d ~/.tmux/plugins/tpm ]
then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -d ~/.config/tmux ]
then
  ln -s $SCRIPT_DIR/tmux ~/.config/tmux
fi

if [ ! -d ~/.config/git ]
then
  ln -s $SCRIPT_DIR/git ~/.config/git
fi

if [ ! -d ~/.config/nvim ]
then
  ln -s $SCRIPT_DIR/nvim ~/.config/nvim
fi

if [ ! -e ~/.config/starship.toml ]
then
  ln -s $SCRIPT_DIR/starship/starship.toml ~/.config/starship.toml
fi

echo "Your system is ready! 👌"
echo "Restart your terminal or run 'fish' to start having fun."
