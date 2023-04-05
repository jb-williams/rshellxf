#!/usr/bin/env bash

if ! which go &>/dev/null; then
    install_go || exit 1
else
    printf '%s\n' "Golang already installed!!" && exit 0
fi

install_golang() {
    VERSION="$(curl https://go.dev/dl/ | grep -iE '<span>go[0-9].[0-9]{2}.[0-9]{1,2}.linux-amd64.tar.gz' | sed -e 's/<[^>]*.//g' | tr -d ' ')"
    read -p "Curl read Current Go Version as \"$VERSION\" : Would you like to Continue?(Y/n): " -n 1 -r
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        pushd /tmp || return
        wget https://go.dev/dl/"$VERSION"
        tar xvfz "$VERSION"
        if [[ -d /usr/local/go ]]; then
            sudo rm -rf /usr/local/go
            sudo mv go /usr/local/
            rm "$VERSION"
        else 
            sudo mv go /usr/local/
            rm "$VERSION"
        fi

        if ! echo "$PATH" | grep -q "/usr/local/go"; then
            echo "export PATH:${PATH}:/usr/local/go" >> "${HOME}"/.bashrc
        fi
        popd || return
    fi
}
