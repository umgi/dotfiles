


connections=$(nmcli connection show | sed -E '1d; s/--/down/; s/^(.*?\S)  .+  .+  ([^ ]+).+/\2 \1/' | sort)
section=$(printf "$connections\\nnet off\nnet on" | dmenu -i -p "nm:")


case $section in
  "net off") nmcli networking off ;;
  "net on") nmcli networking on ;;
  *)
    status=$(echo $section | awk '{print $1}')
    conn=$(echo $section | sed -E 's/^\S*? //')
    echo $status
    echo $conn
    case $status in
      "down")
        nmcli networking on
        nmcli connection up "$conn"
        ;;
      *) nmcli connection down "$conn";;
    esac
    ;;
esac
pkill -RTMIN+4 dwmblocks
