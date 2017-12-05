#!/bin/sh

# setup folder structure
mkdir ~/src


# brew setup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

## apps
brew install git
brew install node
brew install unrar

## OSX native apps
brew tap caskroom/cask

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

### browsers
installcask firefox
installcask google-chrome

### dev
installcask dash
installcask iterm2
installcask visual-studio-code

### utils
installcask 1password
installcask alfred
installcask authy
installcask dropbox
installcask franz
installcask nordvpn
installcask skype
installcask slack
installcask spotify
installcask vlc

# global npm dependencies
npm install -g eslint
npm install -g svgo
npm install -g subtitler


## Get dotfiles repo
cd ~/src/
git clone https://github.com/arthurgouveia/dotfiles.git

### Setup symlinks
cd ~/
ln -s ~/src/dotfiles/gitconfig .gitconfig
ln -s ~/src/dotfiles/gitignore_global .gitignore_global
