#!/usr/bin/env bash


# Ask for admin password upfront
sudo -v
set -e

# Keep session alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

SCRIPT=$PWD
DOTFILES="$HOME/.config"

function install_packages() {
    # Install neovim
    echo "✔ Installing Neovim from source"
    git clone https://github.com/neovim/neovim ${HOME}/packages/neovim
    cd $HOME/packages/neovim
    sudo make CMAKE_BUILD_TYPE=Release
    sudo make install
    cd $SCRIPT

    # Install Packer
    echo "✔ Installing Packer"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # Install Rust
    echo "✔ Installing Rust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env

    echo "✔ Installing Rust tooling"
    rustup update
    rustup toolchain add nightly
    rustup component add rls rust-analysis rust-src

    # Install Rust Analyzer
    git clone https://github.com/rust-analyzer/rust-analyzer.git $HOME/packages/rust-analyzer
    cd $HOME/packages/rust-analyzer
    cargo xtask install --server
    cd $SCRIPT

    # Install Fisher
    echo "✔ Installing Fisher"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install edc/bass

    # Install NVM
    echo "✔ Installing NVM"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    nvm install node
    nvm install 16.15.0

    # Install Alacritty Colorschemes
    echo "✔ Installing Alacritty colorschemes"
    git clone https://github.com/eendroroy/alacritty-theme.git ~/.alacritty-colorscheme
}

function setup_git() {
    if [ -n "$(git config --global user.email)"]; then
        echo "✔ Git email is set to $(git config --global user.email)"
    else
        read -p "What is your Git email address?: " gitEmail
        git config --global user.email "$gitEmail"
    fi

    if [ -n "$(git config --global user.email)"]; then
        echo "✔ Git username is set to $(git config --global user.name)"
    else
        read -p "What is your Git username?: " gitName
        git config --global user.name "$gitName"
    fi

    echo "✔ Setting Nvim as git editor"
    git config --global core.editor $(which nvim)

    echo "✔ Generating ssh key"
    ssh-keygen -t ed25519 -C "$gitEmail"

    echo "✔ Evaluation ssh agent"
    eval "$(ssh-agent -s)"

    echo "✔ Setting git pull --rebase"
    git config --global pull.rebase true
}

function run_dotbot() {
  CONFIG="install.conf.yaml"
  DOTBOT_DIR="dotbot"

  DOTBOT_BIN="bin/dotbot"
  BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  cd "${BASEDIR}"
  git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
  git submodule update --init --recursive "${DOTBOT_DIR}"

  "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
}


source bin/brew.sh
source bin/osx.sh

install_packages
setup_git
run_dotbot
