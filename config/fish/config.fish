eval (python -m virtualfish compat_aliases)
if type gvm 2> /dev/null
	gvm 1.14.3 | source
end

alias vi nvim
alias vim nvim

ulimit -n 5000

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mikezorn/google-cloud-sdk/path.fish.inc' ]; . '/Users/mikezorn/google-cloud-sdk/path.fish.inc'; end
