#!/bin/bash

cd $HOME

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Commenting this out for now
	apt update
	apt upgrade -y 
	apt install -y curl git zsh
	chsh -s $(which zsh)
	echo "TEMP PASS"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "ERROR: NO COMMANDS YET" 1>&2
	exit 1
	
else
	echo "ERROR: OS is unknown.  Exiting" 1>&2
    	exit 1 # terminate and indicate erro
fi

echo "STARTING HOMEBREW INSTALL"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "DONE INSTALLING HOMEBREW"

echo >> $HOME/.zshrc

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "LINUX"
	BREW="/home/linuxbrew/.linuxbrew/bin/brew"

	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.zshrc
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "ERROR: NO COMMANDS YET" 1>&2
	exit 1
fi


$BREW install ansible

git clone https://github.com/darrenbrokeit/environment.git
cd environment
git checkout brew-ansible-setup
ansible-playbook $HOME/environment/setup/site.yml
