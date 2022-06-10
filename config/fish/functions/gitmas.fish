function gitmas --wraps='git checkout master && git pull --ff-only' --wraps='git checkout main && git pull --ff-only' --description 'alias gitmas git checkout main && git pull --ff-only'
  git checkout main && git pull --ff-only $argv; 
end
