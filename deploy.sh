#!/bin/bash
current_path=$(pwd)

# Deploy emacs config
ln -sf "$current_path"/config.org ~/.emacs.d/config.org
ln -sf "$current_path"/org-capture-template ~/.emacs.d/.
touch ~/.emacs.d/custom.el #File needs to be existing for emacs config to work

pushd dotfiles
for dotfile in .*
do
    ln -sf "$(pwd)"/"$dotfile" ~/"$dotfile"
done
popd

pushd config
for conf in *
do
    ln -sf "$(pwd)"/"$conf" ~/.config/.
done
popd

pushd scripts
for script in *
do
    ln -sf "$(pwd)"/"$script" ~/bin/"$script"
done
popd
