# Defined in - @ line 1
function enable-headset --wraps='pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo' --description 'alias enable-headset pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo'
  pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo $argv;
end
