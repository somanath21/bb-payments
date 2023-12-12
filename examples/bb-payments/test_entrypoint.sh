#!/bin/bash
echo $AWS_SECRET_ACCESS_KEY
echo $AWS_REGION
echo $AWS_CIRCLECI_ROLE_ARN
echo $EKS_CLUSTER
echo $SANDBOX_DOMAIN
cat  /home/circleci/parameters.json
chmod u+x entrypoint.sh

# aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && aws configure set default.region eu-central-1
# aws configure --profile playground

aws eks update-kubeconfig --name sandbox
helm test g2p-sandbox -n paymenthub
# helm upgrade --install -f helm/govstack-chart/values.yaml g2p-sandbox helm/govstack-chart --create-namespace  --namespace paymenthub
# helm upgrade -f helm/fineract/values.yaml fineract helm/fineract --install --create-namespace --namespace fineract
# helm test g2p-sandbox -n paymenthub
