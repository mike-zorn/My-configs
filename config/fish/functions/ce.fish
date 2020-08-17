function ce
      builtin cd (echo $PWD|sed -e "s/$argv[1]/$argv[2]/")
end
