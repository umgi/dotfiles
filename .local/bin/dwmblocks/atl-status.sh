log=$XDG_DATA_HOME/atl/log

n=$(cat $log | tail -n 1)
n_status=$(echo $n | awk -F, '{print $1}')
n_time=$(echo $n | awk -F, '{print $2}')
n_act=$(echo $n | awk -F, '{print $3}')

diff=$(($(date "+%s") - n_time))
icon= [ $n_status = 'start' ] && icon="💚" || icon="💤"

seconds=$((diff % 60))
minutes=$((diff / 60 % 60))
hours=$((diff / 3600))

if [ $minutes = '0' ]; then
  time="${seconds}s"
elif [ $hours = '0' ]; then
  time="${minutes}m ${seconds}s"
else
  time="${hours}h ${minutes}m"
fi

echo "${icon} ${time} ${n_act}"
