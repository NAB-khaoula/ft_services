#export variables of minikube env to this terminal
eval $(minikube docker-env)

#to install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#delete if there is any deployement
kubectl delete deploy --all

kubectl delete svc --all

#delete all images
docker system prune -a -f

#build the images
docker build -t nginx ./srcs/nginx
docker build -t wordpress ./srcs/wordpress
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t mysql ./srcs/mysql
# docker build -t grafana ./srcs/grafana

#deploy the configmap
kubectl apply -f ./srcs/yaml_files/metallb.yaml

#deploy all services 
kubectl apply -f ./srcs/yaml_files/nginx.yaml     
kubectl apply -f ./srcs/yaml_files/wordpress.yaml
kubectl apply -f ./srcs/yaml_files/mysql.yaml
# kubectl apply -f ./srcs/yaml_files/ftps.yaml
kubectl apply -f ./srcs/yaml_files/phpmyadmin.yaml
# kubectl apply -f ./srcs/yaml_files/grafana.yaml

#minikube dashboard check
minikube dashboard
