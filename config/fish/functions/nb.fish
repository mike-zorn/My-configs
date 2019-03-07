function nb -a args -d "Record a note"
  set nb_path ~/Documents/nbs
  set today (date "+%m-%d-%y")
  set today_file $nb_path/$today

  switch "$args"
    case ""
      echo | vipe | _nb $nb_path $today_file
    case "-"
      cat - | _nb $nb_path $today_file
    case "--help"
      _nb_help >&2
    case "-t"
      cat $today_file
    case \*
      echo "$args" | _nb $nb_path $today_file
    end
end

function _nb -a nb_path -a today_file
  mkdir -p $nb_path
  date "+%T" >> $today_file
  cat - >> $today_file
  echo '' >> $today_file
end

function _nb_help
  echo "usage: nb --help        Show this help"
  echo "       nb               Create a note interactively"
  echo "       nb -             Write stdin to a note"
  echo "       nb 'text'        Write text to a note"
  echo "       nb -t            Read today's note"
end
