all: sync

brew:
	brew bundle --file ./homebrew/Brewfile

test:
	rm -rf ~/.oh-my-zsh
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
	echo test

zsh:
	rm -rf ~/.oh-my-zsh
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
	ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting



sync: clean
	[ -f ~/.gitconfig ] || ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
	[ -f ~/.gitignore ] || ln -s ~/.dotfiles/git/gitignore ~/.gitignore
	[ -f ~/.zshrc ] || ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
	[ -f ~/Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json ] || ln -s ~/.dotfiles/iterm/Profiles.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json
	defaults write com.googlecode.iterm2 PrefsCustomFolder -string  ~/.dotfiles/iterm
	defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
	

clean:
	rm ~/.gitconfig
	rm ~/.gitignore
	rm ~/.zshrc

.PHONY: all brew zsh sync clean
