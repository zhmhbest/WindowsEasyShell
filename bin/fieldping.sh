default_field=192.168.1
echo -n "Field($default_field): "
read field;
: ${field:=$default_field}
echo "PING: $field.*"
echo '----------------'
if [ 'Windows_NT' == "$OS" ]; then
    ping_config='-n 1 -w 1'
else
    ping_config='-c 1 -W 1'
fi
for ((i=0; i<=255; i++)); do
    host=$field.$i
    ping $ping_config $host >/dev/null && echo PONG: $host &
done
wait
echo '----------------'
echo 'done'
