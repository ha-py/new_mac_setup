
# adapter fro https://medium.com/macoclock/automating-your-macos-setup-with-homebrew-and-cask-e2a103b51af1

## pathikrit/mac-setup-script
# function to install or upgrade brews
function brew_install_or_upgrade {
  if brew ls --versions "$1" >/dev/null; then
    if (brew outdated | grep "$1" > /dev/null); then 
      echo "Upgrading already installed package $1 ..."
      brew upgrade "$1"
    else 
      echo "Latest $1 is already installed"
    fi
  else
    brew install "$1"
  fi
}

function cask_install_or_upgrade {
  if brew ls --versions "$1" >/dev/null; then
    if (brew outdated | grep "$1" > /dev/null); then
      echo "Upgrading already installed package $1 ..."
      brew cask upgrade "$1"
    else
      echo "Latest $1 is already installed"
    fi
  else
    brew cask install "$1"
  fi
}

# Update homebrew recipes
brew tap federico-terzi/espanso

brew update
brew doctor

PACKAGES=(
    zsh-autosuggestions
    zsh-syntax-highlighting
	gnupg2
	pinentry-mac
    dockutil
    howdoi
    espanso
    midnight-commander
    nmap
    speedtest-cli
    tree
    wget
    htop
    ack
    tmux
    the_silver_searcher
    reattach-to-user-namespace
    imagemagick
    bat
    macvim
    mysql
    fzf
    ctags
    readline
    wget
    openssh
)

echo "Install packages"
for i in "${PACKAGES[@]}"; brew_install_or_upgrade "$i"



echo "Installing casks..."
CASKS=(
	google-earth
  	emacs
    iterm2
    dropbox
    google-chrome
    visual-studio-code
    dynalist
    qgis
    macdown
)
echo "Installing cask apps..."
brew tap homebrew/cask-versions
for i in "${CASKS[@]}"; cask_install_or_upgrade "$i"


echo "Cleaning up..."
brew cleanup

echo "Brew install setup completed!"

