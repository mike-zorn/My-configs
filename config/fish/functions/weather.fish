# Defined in - @ line 1
function weather --wraps='bash (which wttr)' --description 'alias weather bash (which wttr)'
  bash (which wttr) $argv;
end
