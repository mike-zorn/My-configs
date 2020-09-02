eval (python -m virtualfish compat_aliases 2>/dev/null)
if type gvm 2> /dev/null 1> /dev/null
	gvm 1.14.3 | source
end

ulimit -n 5000
starship init fish | source
