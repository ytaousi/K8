#create pma tables,
#while ! influx -host "${DB_HOST}"; do
while ! curl -sL -I "${DB_HOST}:8086/ping"; do
    echo "[!] Waiting for influxdb at ${DB_HOST}"
    sleep 1
done
