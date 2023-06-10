all: sync

sync:
		[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
