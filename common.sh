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
	echo "ALL DONE FOLKS!!!"
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
	nvim +VundleInstall -c ':qa'
}

function configTmux {
	# configuring tmux
	rm -rf ~/.tmux.conf
	ln -s "$PWD"/tmux.conf ~/.tmux.conf
	ln -s "$PWD"/tmuxinator ~/.config/tmuxinator
}

function createRsaKey {
	[ ! -e ~/.ssh/id_rsa.pub ] && echo "Criando chave ssh"
	[ ! -e ~/.ssh/id_rsa.pub ] && ssh-keygen
}
