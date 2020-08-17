#! /usr/bin/fish

set files vim vimrc config/fish config/git config/alacritty config/configstore config/coc

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
