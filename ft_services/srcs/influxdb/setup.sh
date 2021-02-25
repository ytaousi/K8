rc-status

_isRunning() {
    pgrep "$1" >/dev/null 2>&1
}

influxd -config=/etc/influxdb.conf &
while [ 1 ]
do 
    sleep 10
    if ! _isRunning influxd ; then
        influxd -config=/etc/influxdb.conf &
    fi
done &  

sleep 5
influx -execute "CREATE USER telegraf WITH PASSWORD 'telegraf' WITH ALL PRIVILEGES"
sleep 2
telegraf
exec /bin/sh
