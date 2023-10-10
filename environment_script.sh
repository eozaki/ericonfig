#! /bin/bash

source common.sh
source linuxSteps.sh
source macSteps.sh

function linuxPreparation {
	sudo echo "Starting linux tools instalation:"
	
	createRsaKey

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

	configRepoForConfigs

	finishMessage
}

function macOsPreparation {
	sudo echo "Starting macOS tools instalation:"

	createRsaKey

	installMacXCode > /dev/null & loadingAnimation 20
	installMacDeps > /dev/null & loadingAnimation 30

	configGit > /dev/null & loadingAnimation 40

	installMacNvim > /dev/null & loadingAnimation 50

	installAsdf > /dev/null & loadingAnimation 60

	# Shell config step cant have status animation, it gets things screwed up
	configShell
	configShellTheme > /dev/null & loadingAnimation 80

	# Vim step cant have status animation, it gets things screwed up
	configVim

	configTmux > /dev/null & loadingAnimation 100

	configRepoForConfigs

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
