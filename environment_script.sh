#! /bin/bash

source common.sh
source linuxSteps.sh
source macSteps.sh

function linuxPreparation {
	sudo echo "Starting linux tools instalation:"
	
	createRsaKey

	linuxDeps
	linuxFonts
	linuxElementaryTerminal

	configGit

	installAsdf

	configShell
	configShellTheme

	# Vim step cant have status animation, it gets things screwed up
	configVim

	configTmux

	configRepoForConfigs

	finishMessage
}

function macOsPreparation {
	sudo echo "Starting macOS tools instalation:"

	createRsaKey

	installMacXCode
	installMacBrew
	installMacDeps

	configGit

	installAsdf

	# Shell config step cant have status animation, it gets things screwed up
	configFishStandardShell
	configShell
	configShellTheme

	# Vim step cant have status animation, it gets things screwed up
	configVim

	configTmux

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
