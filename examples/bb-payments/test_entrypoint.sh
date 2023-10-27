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

# # Set your AWS credentials and AWS CLI configuration
# AWS_CIRCLECI_ROLE_ARN="your-role-arn"
# AWS_REGION="your-aws-region"
# EKS_CLUSTER="your-eks-cluster"

# Access environment variables from CircleCI context directly
AWS_ROLE_ARN=$(circleci context show my-context --environment | grep VAR1= | cut -d'=' -f2)
AWS_REGION=$(circleci context show my-context --environment | grep VAR2= | cut -d'=' -f2)

# Use the variables in your script
echo "AWS_ROLE_ARN: $AWS_ROLE_ARN"
echo "AWS_REGION: $AWS_REGION"

# AWS_ROLE_ARN=$AWS_CIRCLECI_ROLE_ARN
# AWS_REGION=$AWS_REGION
aws eks update-kubeconfig --name GStack-sb-eks-plg
helm upgrade --install -f helm/govstack-chart/values.yaml g2p-sandbox helm/govstack-chart --create-namespace  --namespace paymenthub
helm upgrade -f helm/fineract/values.yaml fineract helm/fineract --install --create-namespace --namespace fineract
# helm test g2p-sandbox -n paymenthub
