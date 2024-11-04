all: sync

brew:
	brew bundle --file ./homebrew/Brewfile

zsh:
	rm -rf ~/.oh-my-zsh
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
	ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

sync: clean
	[ -f ~/.gitconfig ] || ln -s ~/Documents/GitHub/dotfiles/git/gitconfig ~/.gitconfig
	[ -f ~/.gitignore ] || ln -s ~/Documents/GitHub/dotfiles/git/gitignore ~/.gitignore
	[ -f ~/.zshrc ] || ln -s ~/Documents/GitHub/dotfiles/zsh/zshrc ~/.zshrc

clean:
	rm ~/.gitconfig
	rm ~/.gitignore
	rm ~/.zshrc

.PHONY: all brew zsh sync clean
