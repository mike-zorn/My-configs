#! /opt/homebrew/bin/fish

set files config/fish config/git config/alacritty config/configstore config/nvim config/i3 config/i3status config/rofi config/dunst

for file in $files
	if test -L ~/.$file
		continue
	end
	ln -s (pwd)/$file ~/.$file
end
