#!/bin/bash

# docker setup
curl -fsSL https://get.docker.com -o get-docker.sh; sudo sh get-docker.sh; rm get-docker.sh;
sudo usermod -aG docker $USER

# For xdg-open
sudo apt-get install --reinstall xdg-util

# Install gh cli
apt-get install gh
# Preferable to use SSH keys
# Get user scope so that we can access the user email to quickly switch between different user accounts
gh auth login -h github.com -s user,read:project,workflow 
gh auth setup-git 

# Clone and stow dotfiles
dfp=$HOME/dotfiles
git clone https://github.com/13janderson/dotfiles $dfp 
cd $dfp
stow .
cd -

# Langugage installations
source $HOME/.local/bin/scripts/install-jsts.sh
source $HOME/.local/bin/scripts/install-python.sh
source $HOME/.local/bin/scripts/install-go.sh

# Nvim installation
source $HOME/.local/bin/scripts/install-nvim.sh

# Install zsh and pre-configure it with oh-my-zsh
apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"\

# Install fzf. Default opts configured in dotfiles
apt-get install fzf -y
apt-get install bat -y

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Clone obsidian notes into ~/vault
git clone https://github.com/13janderson/obsidian_notes ~/vault

# Extra
sudo apt install xclip
sudo apt install jq # Nice JSON output, this is amazing
