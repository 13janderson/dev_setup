#!/bin/bash

# docker setup
curl -fsSL https://get.docker.com -o get-docker.sh; sudo sh get-docker.sh; rm get-docker.sh;

# Install gh cli
apt-get install gh
# Preferable to use SSH keys
# Get user scope so that we can access the user email to quickly switch between different user accounts
gh auth login -h github.com -s user
gh auth setup-git 
git config --global core.excludefile ~/.gitignore
#git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-wincred.exe"

# Instal zsh and pre-configure it with oh-my-zsh
apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install powerlevel10k, config in dotfiles. Set as default theme in .zshrc
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/.powerlevel10k

# Install fzf. Default opts configured in dotfiles
apt-get install fzf -y
apt-get install bat -y

# Install neovim
apt-get install neovim -y

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
