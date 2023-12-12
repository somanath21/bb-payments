#!/bin/bash
echo $AWS_SECRET_ACCESS_KEY
echo $AWS_REGION
echo $AWS_CIRCLECI_ROLE_ARN
echo $EKS_CLUSTER
echo $SANDBOX_DOMAIN
cat  /home/circleci/parameters.json
# chmod u+x entrypoint.sh
# - aws-cli/setup:
#     role_arn: "${AWS_CIRCLECI_ROLE_ARN}"
#     region: ${AWS_REGION}
#     role_session_name: CircleCISession
#     session_duration: '1800'  
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
