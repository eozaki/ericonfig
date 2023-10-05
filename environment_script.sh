#! /bin/bash

function linuxPreparation {
# 	# Getting started with updates
# 	sudo apt update && sudo apt full-upgrade -y
# 	sudo apt-get install fish git vim meld software-properties-common ruby ruby-dev synapse xdotool libinput-tools libpq-dev libgmp3-dev curl cowsay fortune dconf neovim silversearcher-ag gnupg2 -y

#  	# Copying font files and making them available
#  	mkdir ~/.fonts
#  	cp -r "$PWD"/*.ttf ~/.fonts
#  	cp -r "$PWD"/*.otf ~/.fonts
#  	fc-cache -f -v
# 	
# 	# Setting terminal theme
#  	# Set correct font
#  	dconf write /io/elementary/terminal/settings/font "'Monaco for Powerline 13'"
# 	dconf write /io/elementary/terminal/settings/theme "'custom'"
#  
#  	# Configuring git
#         rm -rf ~/.gitconfig
#  	ln -s "$PWD"/.gitconfig ~/.gitconfig
# 
# 	# Install asdf
# 	rm -rf ~/.asdf
# 	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
#  
#  	# Making fish the default shell
#  	chsh -s /usr/bin/fish
# 
# 	# Linking pre-configured config filed for fish
#  	rm -rf ~/.config/fish
#  	ln -s "$PWD"/fish ~/.config/fish
#  	rm -rf ~/.config/omf
#  	ln -s "$PWD"/omf ~/.config/omf
#  
# 	# Install bullet-train theme
# 	omf install https://github.com/kobanyan/bullet-train-fish-theme
# 
# 	# Install git plugin for omf
# 	omf install https://github.com/jhillyerd/plugin-git
# 
#  	# Using vim config file and installing needed xclip (clipboard manager)
#  	sudo apt install xclip -y
#  	rm ~/.vimrc
#  	ln -s "$PWD"/vimrc ~/.vimrc
#  
#  	# Configuring vim plugins
#  	rm -rf .vim
#  	mkdir .vim
#  	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#  	ln -s ~/.vim ~/.config/nvim
# 	rm -rf ~/.config/nvim/init.vim
#  	ln -s ~/.vimrc ~/.config/nvim/init.vim
# 	nvim +VundleInstall
#  
  	# installing tmux
  	sudo apt install tmux tmuxinator
#  
#  	# configuring tmux
#   rm -rf ~/.tmux.conf
#  	ln -s "$PWD"/tmux.conf ~/.tmux.conf
# 
}

platform='unknown'

unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
	echo "Starting linux tools instalation:"
	linuxPreparation
elif [[  "$unamestr" == 'Darwin' ]]; then
	echo "AQUI É MAC"
else
	echo "QUE MERDA É ESSA????"
fi

