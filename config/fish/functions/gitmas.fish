# Defined in - @ line 1
function gitmas --wraps='git checkout master && git pull --ff-only' --description 'alias gitmas git checkout master && git pull --ff-only'
  git checkout master && git pull --ff-only $argv;
end
