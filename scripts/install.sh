#!/usr/bin/bash

# Check if brew is installed, if so don't do anything; Same for all the other installs in this file
if ! command -v brew &> /dev/null
then
    echo "brew is not installed, installing now..."
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    exit
fi

if ! command -v ansible &> /dev/null
then
    echo "ansible is not installed, installing now..."
    # Install Homebrew
    brew install ansible
    exit
fi
