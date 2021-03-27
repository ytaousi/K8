export MINIKUBE_HOME=/goinfre/ytaousi/k8
/goinfre/ytaousi/brew/bin/minikube start --memory 4000 --vm-driver=virtualbox
eval $(/goinfre/ytaousi/brew/bin/minikube docker-env)

/goinfre/ytaousi/brew/bin/minikube addons enable 'metallb'

#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
#kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#official images
/goinfre/ytaousi/brew/bin/docker build -t nginx-image nginx/
/goinfre/ytaousi/brew/bin/docker build -t pma-image phpmyadmin/
/goinfre/ytaousi/brew/bin/docker build -t wp-image wordpress/
/goinfre/ytaousi/brew/bin/docker build -t mysql-image mysql/
/goinfre/ytaousi/brew/bin/docker build -t ftps-image ftps/
/goinfre/ytaousi/brew/bin/docker build -t influxdb-image influxdb/
/goinfre/ytaousi/brew/bin/docker build -t grafana-image grafana/

#init container
/goinfre/ytaousi/brew/bin/docker build mysql/init-db -t init-db-img
/goinfre/ytaousi/brew/bin/docker build influxdb/init-influx -t init-influx-image



/goinfre/ytaousi/brew/bin/kubectl delete --all deployments
/goinfre/ytaousi/brew/bin/kubectl delete --all services
/goinfre/ytaousi/brew/bin/kubectl delete --all pvc

/goinfre/ytaousi/brew/bin/kubectl apply -f pvcs.yml
/goinfre/ytaousi/brew/bin/kubectl apply -f services.yml
/goinfre/ytaousi/brew/bin/kubectl apply -f deployments.yml