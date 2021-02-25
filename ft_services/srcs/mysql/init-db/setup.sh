#create pma tables,
while ! mysqladmin ping -h ${DB_HOST} -u admin -padmin --silent; do
    echo "[!] Waiting for host : ${DB_HOST}"
    sleep 1
done
