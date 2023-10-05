#! /bin/bash

# Making user part of input group for fusuma purposes
sudo gpasswd -a $USER input

# Getting started with updates
sudo apt update && sudo apt full-upgrade -y
sudo apt-get install fish git vim meld software-properties-common ruby ruby-dev synapse xdotool libinput-tools libpq-dev libgmp3-dev -y

# Installing fusuma for gestures
mkdir ~/.config
rm -rf ~/.config/fusuma
ln -s "$PWD"/fusuma ~/.config/fusuma
sudo gem install fusuma

# Setting up terminal font
mkdir ~/.fonts
cp -r "$PWD"/*.ttf ~/.fonts
cp -r "$PWD"/*.otf ~/.fonts
fc-cache -f -v

# Configuring git
ln -s "$PWD"/.gitconfig ~/.gitconfig

# Making fish the default shell
chsh -s /usr/bin/fish
rm -rf ~/.config/fish
ln -s "$PWD"/fish ~/.config/fish
rm -rf ~/.config/omf
ln -s "$PWD"/omf ~/.config/omf

# Using vim config file and installing needed xclip (clipboard manager)
sudo apt install xclip -y
rm -rf ~/.vimrc
ln -s "$PWD"/.vimrc ~/.vimrc

# Installing neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim -y

# Configuring vim plugins
mkdir .vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# installing tmux
sudo apt install tmux

# configuring tmux
ln -s "$PWD"/tmux.conf ~/.tmux.conf

# configuring tmuxinator
ln -s "$PWD"/tmuxinator/ ~/.tmuxinator
ln -s "$PWD"/tmuxinator.zsh ~/.tmuxinator.zsh

# installing linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# Installing asdf manager
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0

# Installing rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

# Installing latest ruby
rvm install ruby
gem install tmuxinator

# Set correct font
dconf write /io/elementary/terminal/settings/font "'Monaco for Powerline 13'"
