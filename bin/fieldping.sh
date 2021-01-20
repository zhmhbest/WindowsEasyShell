# default_field=192.168.1
# echo -n "Field($default_field): "
# read field;
# : ${field:=$default_field}

if [ -z $1 ]; then
    field=192.168.1
elif [[ "$1" =~ ^[0-9]+$ ]]; then
    field=192.168.$1
else
    field=$1
fi

echo "PING: $field.*"
echo '----------------'
if [ 'Windows_NT' == "$OS" ]; then
    ping_config='-n 1 -w 3'
else
    ping_config='-c 1 -W 3'
fi
for ((i=0; i<=255; i++)); do
    host=$field.$i
    ping $ping_config $host >/dev/null && echo PONG: $host &
done
wait
echo '----------------'
echo 'done'