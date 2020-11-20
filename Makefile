.PHONY: curl zsh git nvim kerl direnv tmux vagrant

all: curl zsh git nvim tmux

erlang: kerl

curl:
	ln -fs $(PWD)/curl/curlrc ~/.curlrc

zsh:
	ln -fs $(PWD)/zsh/zshrc ~/.zshrc

git:
	ln -fs $(PWD)/git/gitconfig ~/.gitconfig
	ln -fs $(PWD)/git/gitignore_global ~/.gitignore_global

nvim:
	if [ ! -d ~/.config/nvim ]; then \
		mkdir -p ~/.config/nvim/plugged; \
	fi
	if [ ! -d ~/.nvim ]; then \
		mkdir -p ~/.nvim/undo; \
		mkdir -p ~/.nvim/swap; \
		mkdir -p ~/.nvim/session; \
		mkdir -p ~/.nvim/netrw; \
	fi
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -fs $(PWD)/nvim/init.vim ~/.config/nvim/init.vim
	nvim +PlugInstall +qa!

kerl:
	ln -fs $(PWD)/kerl/kerlrc ~/.kerlrc

tmux:
	ln -fs $(PWD)/tmux/tmux.conf ~/.tmux.conf
	if [ ! -d ~/.tmux ]; then \
		mkdir -p ~/.tmux/plugins/tpm; \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	fi
	tmux start-server
	tmux new-session -d
	~/.tmux/plugins/tpm/scripts/install_plugins.sh
	tmux kill-server

vagrant:
	if [ ! -d ~/VM/vagrant ]; then \
		mkdir -p ~/VM/vagrant; \
	fi
