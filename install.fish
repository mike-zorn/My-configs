#! /opt/homebrew/bin/fish

set files vim vimrc config/fish config/git config/alacritty config/configstore config/coc config/i3 config/i3status config/rofi config/dunst

for file in $files
	if test -L ~/.$file
		continue
	end
	ln -s (pwd)/$file ~/.$file
end
if not test -L ~/.config/nvim
	ln -s ~/.vim ~/.config/nvim
end
if not test -L ~/.vim/init.vim
	ln -s ~/.vimrc ~/.vim/init.vim
end
