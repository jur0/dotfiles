.PHONY: oh-my-zsh git vim

all: oh-my-zsh git vim

oh-my-zsh:
	ln -fs $(PWD)/oh-my-zsh/zshrc ~/.zshrc

git:
	ln -fs $(PWD)/git/gitconfig ~/.gitconfig

vim:
	if [ ! -d ~/.vim ]; then \
		mkdir -p ~/.vim/bundle; \
		mkdir -p ~/.vim/tmp/backup; \
		mkdir -p ~/.vim/tmp/swap; \
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim; \
		vim +PluginInstall +qall; \
	fi
	ln -fs $(PWD)/vim/vimrc ~/.vimrc
	ln -fs $(PWD)/vim/ftplugin ~/.vim/ftplugin
	ln -fs $(PWD)/vim/ftdetect ~/.vim/ftdetect

