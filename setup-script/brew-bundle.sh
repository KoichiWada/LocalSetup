#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src

TAPS=(
    homebrew/binary
    homebrew/versions
    phinze/homebrew-cask
)

FORMULAS=(
    brew-cask
    jq
    jenkins
    #composer
    ## Graphviz
    gts
    graphviz
)

CASKS=(
# Cask Packages
    iterm2
    alfred
    evernote
    dropbox
    skype
    mysqlworkbench
    sequel-pro
    firefox
    google-chrome
    virtualbox
    vagrant
    eclipse-ide
)

brew update
brew upgrade

# taps
for tap in "${TAPS[@]}"; do
    brew tap $tap
done

for formula in "${FORMULAS[@]}"; do
    brew install $formula
done

for cask in "${CASKS[@]}"; do
    brew cask install $cask
done

brew cleanup
brew doctor
