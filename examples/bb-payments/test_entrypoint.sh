#!/bin/bash
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# # Access environment variables from the CircleCI context
# AWS_ROLE_ARN="${AWS_CIRCLECI_ROLE_ARN}"
# AWS_REGION="${AWS_REGION}"

# # Set AWS CLI configuration
# aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
# aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
# aws configure set aws_session_token "$AWS_SESSION_TOKEN"
# aws configure set default.region "$AWS_REGION"

# # Use the variables in your script
# echo "AWS_ROLE_ARN: $AWS_ROLE_ARN"
# echo "AWS_REGION: $AWS_REGION"

CLUSTER_NAME=$(eval echo "$EKS_CLUSTER")
AWS_REGION=$(eval echo "$AWS_REGION")
AWS_PROFILE= "playground"
ROLE_ARN=$(eval echo "$AWS_CIRCLECI_ROLE_ARN")

# aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && aws configure set default.region eu-central-1
# aws configure --profile playground
# aws eks update-kubeconfig --name GStack-sb-eks-plg
helm upgrade --install -f helm/govstack-chart/values.yaml g2p-sandbox helm/govstack-chart --create-namespace  --namespace paymenthub
helm upgrade -f helm/fineract/values.yaml fineract helm/fineract --install --create-namespace --namespace fineract
# helm test g2p-sandbox -n paymenthub
