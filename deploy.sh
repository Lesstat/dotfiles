#!/bin/bash

ln -sf ~/workspaces/bash/bash_config/.emacs ~/.emacs
ln -sf ~/workspaces/bash/bash_config/config.org ~/.emacs.d/config.org
touch ~/.emacs.d/custom.el #File needs to be existing for emacs config to work
ln -sf ~/workspaces/bash/bash_config/.bashrc ~/.bashrc
ln -sf ~/workspaces/bash/bash_config/.bash_login ~/.bash_login
ln -sf ~/workspaces/bash/bash_config/.bash_logout ~/.bash_logout
ln -sf ~/workspaces/bash/bash_config/.bash_profile ~/.bash_profile
ln -sf ~/workspaces/bash/bash_config/.bashrc ~/.bashrc
