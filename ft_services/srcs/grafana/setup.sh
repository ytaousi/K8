sed -i "s/;provisioning/provisioning/g" /etc/grafana.ini
sed -i "s/url:/url: http:\/\/${DB_HOST}:8086/g" /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml

#exec "/bin/sh"

cd /usr/share/grafana && grafana-server --config=/etc/grafana.ini