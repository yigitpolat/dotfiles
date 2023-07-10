all: sync

brew:
	brew bundle --file ./homebrew/Brewfile

zsh:
# rm -rf ~/.oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
	ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	git clone https://github.com/z-shell/F-Sy-H.git ~/.oh-my-zsh/custom/plugins/F-Sy-H
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions


sync:
	[ -f ~/.gitconfig ] || ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
	[ -f ~/.gitignore ] || ln -s ~/.dotfiles/git/gitignore ~/.gitignore
	[ -f ~/.zshrc ] || ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
# defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iterm2"
# defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

clean:
	rm ~/.gitconfig
	rm ~/.gitignore
	rm ~/.zshrc

.PHONY: all brew zsh sync clean
