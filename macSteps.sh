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
