#!/bin/bash

checkRequirements() {
    if ! command -v git &> /dev/null
    then
        echo "git is required to install BATS"
        exit 1
    fi
    # TODO: revisit if SUDO is needed. Keeping for patch compatability
    if [[ $EUID == 0 ]]; then export SUDO=""; else export SUDO="sudo"; fi
}

installBats() {
    checkRequirements
    cd /tmp || exit 1
    git clone https://github.com/bats-core/bats-core.git
    cd /tmp/bats-core || exit 1
    $SUDO ./install.sh /usr/local
    if ! command -v bats &> /dev/null
    then
        echo "BATS failed to install"
        echo "Please open an issue at: https://github.com/CircleCI-Public/BATS-orb/issues"
        exit 1
    else
        echo "BATS installed successfully"
    fi
}

setupBats() {
    if ! command -v bats &> /dev/null 
    then
    # BATS is not installed
        installBats
    else
    # BATS is installed
        echo "BATS is already available"
    fi
}

setupBats
