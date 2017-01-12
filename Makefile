.PHONY: zsh git vim nvim kerl direnv tmux vagrant

all: zsh git nvim tmux kerl direnv

zsh:
	ln -fs $(PWD)/zsh/zshrc ~/.zshrc

git:
	ln -fs $(PWD)/git/gitconfig ~/.gitconfig
	ln -fs $(PWD)/git/gitignore_global ~/.gitignore_global

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
	if [ ! -d ~/.nvim ]; then \
		mkdir -p ~/.nvim/backup; \
		mkdir -p ~/.nvim/swap; \
		mkdir -p ~/.nvim/session; \
	fi
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -fs $(PWD)/nvim/init.vim ~/.config/nvim/init.vim
	nvim +PlugInstall +qa!
	sed -i 's/" colorscheme/colorscheme/' $(PWD)/nvim/init.vim

kerl:
	ln -fs $(PWD)/kerl/kerlrc ~/.kerlrc

direnv:
	if [ ! -d ~/.config/direnv ]; then \
		mkdir -p ~/.config/direnv; \
	fi
	ln -fs $(PWD)/direnv/direnvrc ~/.config/direnv/direnvrc

tmux:
	ln -fs $(PWD)/tmux/tmux.conf ~/.tmux.conf

vagrant:
	if [ ! -d ~/VM/vagrant ]; then \
		mkdir -p ~/VM/vagrant; \
	fi
