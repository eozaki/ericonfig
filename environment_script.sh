#! /bin/bash

source common.sh
source linuxSteps.sh
source macSteps.sh

RED='\033[0;31m'
DEFAULT='\033[0m' # No Color


function linuxMenu {
	selection=1
	while [[ ! "$selection" == 0 ]];
	do
		menu="\n\n\n##############################################\n\n"
		menu=$menu"1 - Criar chave de acesso RSA;\n"
		menu=$menu"2 - Instalar dependencias gerais de sistema\n   (vim, git, fish, tmux, ...);\n"
		menu=$menu"3 - Substituir arquivos de config do git;\n"
		menu=$menu"4 - Instalar ASDF (versionador multilinguagem);\n"
		menu=$menu"5 - Configurar terminal e temas;\n"
		menu=$menu"6 - Substituir configuracoes Vim/NVim;\n"
		menu=$menu"7 - Substituir configuracoes Tmux;\n"
		menu=$menu"8 - Configurar o repositorio remoto deste diretorio;\n"
		menu=$menu"9 - Configuracao completa (SUBSTITUIRA DIVERSOS ARQUIVOS DE CONFIG EXISTENTES!!!!);\n"
		menu=$menu"0 - Sair;\n"

		echo -e "$menu"
		read -p " Selecione opcao desejada: " selection

		if [[ $selection -lt 0 ]]; then
			selection=1
			break
		elif [[ "$selection" -eq 1 ]]; then
			createRsaKey
		elif [[ "$selection" -eq 2 ]]; then
			linuxDeps
			linuxFonts
			linuxElementaryTerminal
		elif [[ "$selection" -eq 3 ]]; then
			configGit
		elif [[ "$selection" -eq 4 ]]; then
			echo -e "${RED}Este passo pode depender da instalacao de dependencias de sistema ${DEFAULT}"
			echo -e "${RED}Em caso de falha deste passo, tente instalar as dependencias de sistema antes ${DEFAULT}"
			installAsdf
		elif [[ "$selection" -eq 5 ]]; then
			configShell
			configShellTheme
		elif [[ "$selection" -eq 6 ]]; then
			configVim
		elif [[ "$selection" -eq 7 ]]; then
			configTmux
		elif [[ "$selection" -eq 8 ]]; then
			configRepoForConfigs
		elif [[ "$selection" -eq 9 ]]; then
			linuxPreparation
		fi

	done
}

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
	linuxMenu
	#linuxPreparation
elif [[  "$unamestr" == 'Darwin' ]]; then
	macOsPreparation
else
	echo "QUE MERDA É ESSA????"
fi
