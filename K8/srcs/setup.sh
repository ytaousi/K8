export MINIKUBE_HOME=/goinfre/ytaousi/k8
export MINIKUBE_PATH=/goinfre/ytaousi/brew/bin/minikube

#start minikube
${MINIKUBE_PATH} start --memory 4000 --vm-driver=virtualbox

#set minikube docker env in ur shell
eval $(${MINIKUBE_PATH} docker-env)

#enable metallb addon
${MINIKUBE_PATH} addons enable 'metallb'

#official images
docker build -t nginx-image nginx/
docker build -t pma-image phpmyadmin/
docker build -t wp-image wordpress/
docker build -t mysql-image mysql/

#init containers images
docker build -t init-db-image mysql/init-db
#docker build -t init-db-image influxdb/init-db

#not proceced yet
#docker build -t influxdb-image influxdb/
#docker build -t grafana-image grafana/

kubectl delete --all deployments
kubectl delete --all services
kubectl delete --all pvc

kubectl apply -f pvcs.yml
kubectl apply -f services.yml
kubectl apply -f deployments.yml
