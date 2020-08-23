#!/bin/bash

install_stuff() {
    FILE = $1 + ".txt"
    while read FILE; do
        if [ $FILE == "#*" ]; then
            sudo code --install-extension $FILE --force
        fi
    done
}

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
fi

for f in *.txt; do
    option = "e"
    while [option != "y"] || [option != "n"]; do
        read -p "Install ${f} stuff (y/n)? "
        if [ option == "y" ]; then
            if [ f == "Ruby" ]; then
                gem install solargraph
            fi
            install_stuff f
        fi
    done
done
