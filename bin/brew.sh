if [ "$(command -v brew)" ]; then
    echo "Homebrew already installed on the system"
fi 

echo "> Updating brew"
brew update
echo "> Upgrading brew"
brew upgrade

# save homebrew installed location
BREW_PREFIX=$(brew --prefix) 

echo "> Installing brew packages"
brew install ack
brew install autoconf
brew install automake
brew install awscli
brew install bottom
brew install cmake
brew install curl
brew install docker
brew install fantastical
brew install fd
brew install findutils
brew install fish
brew install fontconfig
brew install freetype
brew install fzf
brew install gettext
brew install git
brew install git-lfs
brew install gnu-sed --with-default-name
brew install gnutls
brew install go
brew install grep
brew install htop
brew install jpeg
brew install jpeg-xl
brew install jq
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai
brew install lazygit
brew install lf
brew install libtool
brew install markdown
brew install moreutils
brew install neofetch
brew install ninja
brew install nnn
brew install node
brew install nvm
brew install rectangle
brew install pkg-config
brew install tmux
brew install tree
brew install tree-sitter
brew install wget
brew install z
brew install zoxide
brew tap clementtsang/bottom
brew install --cask 1password
brew install --cask alacritty
brew install --cask appcleaner
brew install --cask brave-browser
brew install --cask discord
brew install --cask flycut
brew install --cask font-sf-mono-nerd-font
brew install --cask google-chrome
brew install --cask graphql-playground
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask obsidian
brew install --cask postman
brew install --cask via
brew install --cask visual-studio-code

echo "> Brew cleanup"
brew cleanup

