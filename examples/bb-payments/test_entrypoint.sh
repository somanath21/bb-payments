#!/bin/bash
#insatll kubectl
apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
apt-get install -y apt-transport-https ca-certificates curl gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key |  gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' |  tee /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
kubectl version
#Setup Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
minikube start

minikube kubectl -- get po -A #Interact with Minikube cluster
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml
echo "service-moi=nitor installed"
# aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && aws configure set default.region eu-central-1
# aws configure --profile playground
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
#helm install
sudo apt-get update
sudo apt-get install helm
#payment install
# kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml #Install ServiceMonitor
kubectl create namespace paymenthub
kubectl get -A namespace  
helm repo add g2p-sandbox-1-3-1 https://fynarfin.io/images/ph-ee-g2psandbox-1.3.1/
helm install my-ph-ee-g2psandbox g2p-sandbox-1-3-1/ph-ee-g2psandbox --version 1.3.1 -n paymenthub


# helm upgrade --install -f helm/govstack-chart/values.yaml g2p-sandbox helm/govstack-chart --create-namespace  --namespace paymenthub
# helm upgrade -f helm/fineract/values.yaml fineract helm/fineract --install --create-namespace --namespace fineract
# helm test g2p-sandbox -n paymenthub
