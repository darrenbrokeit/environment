#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Commenting this out for now
	#apt update
	#apt upgrade -y 
	apt install -y curl git zsh
	chsh -s $(which zsh)
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "ERROR: NO COMMANDS YET" 1>&2
	exit 1
	
else
	echo "ERROR: OS is unknown.  Exiting" 1>&2
    	exit 1 # terminate and indicate erro
fi

#NONINTERACTIVE=1 /bin/bash -c "/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'"

#echo >> /root/.zshrc
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	BREW="/home/linuxbrew/.linuxbrew/bin/brew"

#	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.zshrc
#	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "ERROR: NO COMMANDS YET" 1>&2
	exit 1
fi

$BREW install ansible
