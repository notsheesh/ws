#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
    src="$1"
    dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        read -p "$dest exists. Override? [y/N] " answer
        if [[ ! "$answer" =~ ^[Yy]$ ]]; then
            echo "Skipping $dest"
            return
        fi
    fi
    
    ln -sf "$src" "$dest"
    echo "Linked $dest"
}

# vim
link "$DIR/vimrc" ~/.vimrc

# kitty
mkdir -p ~/.config/kitty
link "$DIR/kitty.conf" ~/.config/kitty/kitty.conf

echo "Done"
