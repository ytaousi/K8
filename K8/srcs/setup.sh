docker build -t nginx-image nginx/
docker build -t pma-image phpmyadmin/
docker build -t wp-image wordpress/
docker build -t mysql-image mysql/

#docker build -t influxdb-image influxdb/
#docker build -t grafana-image grafana/


kubectl delete --all deployments
kubectl delete --all services
kubectl delete --all pvc

kubectl apply -f pvcs.yml
kubectl apply -f services.yml
kubectl apply -f deployments.yml