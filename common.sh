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

function configRepoForConfigs {
	git init
	git add .
	git stash
	git remote add origin ssh://git@192.168.1.78:30001/eozaki/ericonfig.git
	git fetch origin
	git checkout main
	git stash pop
}

function installAsdf {
	# Install asdf
	rm -rf ~/.asdf
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
}

function configShell {
	# Making fish the default shell
	chsh -s $(which fish)
	
	# Install omf
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

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

function waitForKeyStroke {
	echo -ne "$1"

	# Loop until a key is pressed
	while true; do
		read -rsn1 key # Read a single character silently
		if [[ -n "$key" ]]; then
			break # Exit the loop if a key is pressed
		fi
	done
}

function createRsaKey {
	[ ! -e ~/.ssh/id_rsa.pub ] && echo "Criando chave ssh"
	[ ! -e ~/.ssh/id_rsa.pub ] && ssh-keygen

	echo -e "\n\n"
	cat ~/.ssh/id_rsa.pub
	echo -e "\n\n\nThis is your public RSA key. Add it to your repo account before moving on.\n"
	waitForKeyStroke "Press any key to continue..."
}
