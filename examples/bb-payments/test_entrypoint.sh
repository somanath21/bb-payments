#!/bin/bash
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version
kubectl cluster-info dump
# kubectl cluster-info

AWS_CIRCLECI_ROLE_ARN="${AWS_CIRCLECI_ROLE_ARN}"
AWS_REGION="${AWS_REGION}"

aws configure set default.region $AWS_REGION

# Assume the specified role
role_credentials=$(aws sts assume-role \
--role-arn $AWS_CIRCLECI_ROLE_ARN \
--role-session-name CircleCISession \
--duration-seconds 1800 \
--output json)

# Extract and set the assumed role credentials as environment variables
export AWS_ACCESS_KEY_ID=$(echo $role_credentials | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $role_credentials | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $role_credentials | jq -r .Credentials.SessionToken)

# Your subsequent AWS CLI commands here
# ...

# Optionally, unset the environment variables to avoid potential issues
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN
kubectl cluster-info
# aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && aws configure set default.region eu-central-1
# aws configure --profile playground
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
# aws eks update-kubeconfig --name sandbox
helm test g2p-sandbox -n paymenthub
# helm upgrade --install -f helm/govstack-chart/values.yaml g2p-sandbox helm/govstack-chart --create-namespace  --namespace paymenthub
# helm upgrade -f helm/fineract/values.yaml fineract helm/fineract --install --create-namespace --namespace fineract
# helm test g2p-sandbox -n paymenthub
