#! /bin/bash

function loadingAnimation {
	pid=$! # Process Id of the previous running command

	spin='-\|/'

	k=0
	progressIcons=""
	while [[ $1 -gt $k ]]
	do
		progressIcons=$progressIcons"#"
		k=$k+1
	done

	i=0
	while kill -0 $pid 2>/dev/null
	do
		i=$(( (i+1) %4 ))
		echo -ne "\r$progressIcons ${spin:$i:1} $1%\r"
		sleep .1
	done
}

function finishMessage {
	printf "ALL DONE FOLKS!!!"
}

function createRsaKey {
	[ ! -e ~/.ssh/id_rsa.pub ] && echo "Criando chave ssh"
	[ ! -e ~/.ssh/id_rsa.pub ] && ssh-keygen
}

function linuxDeps {
	# Getting started with updates
	sudo apt update && sudo apt full-upgrade -y
	sudo apt-get install \
		tmux tmuxinator xclip fish git vim meld software-properties-common \
		ruby ruby-dev synapse xdotool libinput-tools libpq-dev libgmp3-dev \
		curl cowsay fortune dconf neovim silversearcher-ag gnupg2 libreadline6-dev -y
}

function linuxFonts {
	# Copying font files and making them available
	mkdir ~/.fonts
	cp -r "$PWD"/*.ttf ~/.fonts
	cp -r "$PWD"/*.otf ~/.fonts
	fc-cache -f -v
}

function linuxElementaryTerminal {
	# Setting terminal theme
	# Set correct font
	dconf write /io/elementary/terminal/settings/font "'Monaco for Powerline 13'"
	dconf write /io/elementary/terminal/settings/theme "'custom'"
}
function configGit {
	# Configuring git
	rm -rf ~/.gitconfig
	ln -s "$PWD"/.gitconfig ~/.gitconfig
}

function installAsdf {
	# Install asdf
	rm -rf ~/.asdf
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
}

function configShell {
	# Making fish the default shell
	chsh -s /usr/bin/fish

	# Linking pre-configured config filed for fish
	rm -rf ~/.config/fish
	ln -s "$PWD"/fish ~/.config/fish
	rm -rf ~/.config/omf
	ln -s "$PWD"/omf ~/.config/omf
}

function configShellTheme {
	fish omf_config.fish
}

function configVim {
	# Using vim config file
	rm ~/.vimrc
	ln -s "$PWD"/vimrc ~/.vimrc

	# Configuring vim plugins
	rm -rf .vim
	mkdir .vim
	rm -rf ~/.vim/bundle/Vundle.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s ~/.vim ~/.config/nvim
	rm -rf ~/.config/nvim/init.vim
	ln -s ~/.vimrc ~/.config/nvim/init.vim
	nvim +VundleInstall
}

function configTmux {
	# configuring tmux
	rm -rf ~/.tmux.conf
	ln -s "$PWD"/tmux.conf ~/.tmux.conf
	ln -s "$PWD"/tmuxinator ~/.config/tmuxinator
}

function linuxPreparation {
	echo "Starting linux tools instalation:"
	
	createRsaKey > /dev/null & loadingAnimation 10

	linuxDeps > /dev/null & loadingAnimation 20
	linuxFonts > /dev/null & loadingAnimation 30
	linuxElementaryTerminal > /dev/null & loadingAnimation 40

	configGit > /dev/null & loadingAnimation 50

	installAsdf > /dev/null & loadingAnimation 60

	configShell > /dev/null & loadingAnimation 70
	configShellTheme > /dev/null & loadingAnimation 80

	# Vim step cant have status animation, it gets things screwed up
	configVim

	configTmux > /dev/null & loadingAnimation 100

	finishMessage
}

function installMacBrew {
	sudo curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" | bash
}

function installMacXCode {
	xcode-select --install
}

function installMacDeps {
	brew install nvim \
		tmux tmuxinator xclip fish git vim meld cowsay fortune the_silver_searcher gnupg2
}

function macOsPreparation {
	echo "Starting macOS tools instalation:"

	createRsaKey > /dev/null & loadingAnimation 12

	installMacXCode > /dev/null & loadingAnimation 25
	installMacDeps > /dev/null & loadingAnimation 37

	configGit > /dev/null & loadingAnimation 50

	installMacNvim > /dev/null & loadingAnimation 62

	installAsdf > /dev/null & loadingAnimation 75

	# Vim step cant have status animation, it gets things screwed up
	configVim

	configTmux > /dev/null & loadingAnimation 100

	finishMessage
}

platform='unknown'

unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
	linuxPreparation
elif [[  "$unamestr" == 'Darwin' ]]; then
	macOsPreparation
else
	echo "QUE MERDA É ESSA????"
fi
