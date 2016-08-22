#!/bin/bash
current_path=$(pwd)
ln -sf ${current_path}/.emacs ~/.emacs
ln -sf ${current_path}/config.org ~/.emacs.d/config.org
ln -sf ${current_path}/org-capture-template ~/.emacs.d/org-capture-template
touch ~/.emacs.d/custom.el #File needs to be existing for emacs config to work
ln -sf ${current_path}/.bashrc ~/.bashrc
ln -sf ${current_path}/.bash_login ~/.bash_login
ln -sf ${current_path}/.bash_logout ~/.bash_logout
ln -sf ${current_path}/.bash_profile ~/.bash_profile
ln -sf ${current_path}/.bashrc ~/.bashrc
ln -sf ${current_path}/.zshrc ~/.zshrc
ln -sf ${current_path}/.zlogin ~/.zlogin
ln -sf ${current_path}/.zlogout ~/.zlogout
