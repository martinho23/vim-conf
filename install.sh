#!/bin/bash
# File              : install.sh
# Author            : jfarinha <ajoni844@gmail.com>
# Date              : 31.05.2021
# Last Modified Date: 31.05.2021
# Last Modified By  : jfarinha <ajoni844@gmail.com>


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer --enable-debug --valgrind

