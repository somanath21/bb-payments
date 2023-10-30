#!/bin/bash
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
echo "setting cluster"
CLUSTER_NAME=$(eval echo "$EKS_CLUSTER")
AWS_REGION=$(eval echo "$AWS_REGION")
AWS_PROFILE=playground
ROLE_ARN=$(eval echo "$AWS_CIRCLECI_ROLE_ARN")
echo "set the cluster"

# aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && aws configure set default.region eu-central-1
# aws configure --profile playground
aws eks update-kubeconfig --name GStack-sb-eks-plg
helm upgrade --install -f helm/govstack-chart/values.yaml g2p-sandbox helm/govstack-chart --create-namespace  --namespace paymenthub
helm upgrade -f helm/fineract/values.yaml fineract helm/fineract --install --create-namespace --namespace fineract
# helm test g2p-sandbox -n paymenthub
