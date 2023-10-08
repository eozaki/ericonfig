function linuxDeps {
	# Add fish repository for latest version of fish
	sudo apt-add-repository ppa:fish-shell/release-3

	# Getting started with updates
	sudo apt update && sudo apt full-upgrade -y
	sudo apt-get install \
		tmux tmuxinator xclip fish git vim meld software-properties-common \
		ruby ruby-dev synapse xdotool libinput-tools libpq-dev libgmp3-dev \
		curl cowsay fortune dconf-cli neovim silversearcher-ag gnupg2 libreadline6-dev -y
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
