.PHONY: oh-my-zsh git vim nvim

all: oh-my-zsh git nvim

oh-my-zsh:
	ln -fs $(PWD)/oh-my-zsh/zshrc ~/.zshrc

git:
	ln -fs $(PWD)/git/gitconfig ~/.gitconfig

vim:
	if [ ! -d ~/.vim ]; then \
		mkdir -p ~/.vim/bundle; \
		mkdir -p ~/.vim/tmp/backup; \
		mkdir -p ~/.vim/tmp/swap; \
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; \
	fi
	ln -fs $(PWD)/vim/ftplugin ~/.vim/ftplugin
	ln -fs $(PWD)/vim/ftdetect ~/.vim/ftdetect
	vim +PluginInstall +qall
	ln -fs $(PWD)/vim/vimrc ~/.vimrc

nvim:
	if [ ! -d ~/.config/nvim ]; then \
		mkdir -p ~/.config/nvim/plugged; \
	fi
	if [ ! -d ~/.vim ]; then \
		mkdir -p ~/.vim/tmp/backup; \
		mkdir -p ~/.vim/tmp/swap; \
	fi
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -fs $(PWD)/nvim/init.vim ~/.config/nvim/init.vim
	nvim +PlugInstall +qa!
	sed -i 's/" colorscheme/colorscheme/' $(PWD)/nvim/init.vim

