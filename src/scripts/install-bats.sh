checkRequirements() {
    if ! which git > /dev/null; then
        echo "git is required to install BATS"
        exit 1
    fi
    if [[ $EUID == 0 ]]; then export SUDO=""; else export SUDO="sudo"; fi
}

installBats() {
    cd /tmp
    git clone https://github.com/bats-core/bats-core.git
    cd /tmp/bats-core
    $SUDO ./install.sh /usr/local
}


checkInstall() {
    if ! which bats > /dev/null; then
        echo "BATS has failed to install."
        exit 1
    fi
    echo
    echo "BATS-Core installed"
    echo
}

runInstallBats() {
    checkRequirements
    installBats
    checkInstall
}

runInstallBats