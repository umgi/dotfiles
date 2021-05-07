log=$XDG_DATA_HOME/atl/log
new_act=$(cat $log | awk -F, '{print $3}' | sort | uniq | dmenu -i -p "type activity:")

pkill -RTMIN+15 dwmblocks

last=$(cat $log | tail -n 1)
if [ -n $last ]; then
  status=$(echo "$last" | awk -F, '{print $1}')
  time=$(echo "$last" | awk -F, '{print $2}')
  prev_act=$(echo "$last" | awk -F, '{print $3}')

  now=$(date "+%s")
  prev=$((now - 1))

  if [ $status = "start" ]; then
    echo "end,$prev,$prev_act" >> $log
  fi

  pkill -RTMIN+15 dwmblocks
  [ -z $new_act ] && exit 0
  echo "start,$now,$new_act" >> $log
fi
pkill -RTMIN+15 dwmblocks
