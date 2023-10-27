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

# # Assume the specified AWS IAM role
# aws sts assume-role --role-arn "$AWS_CIRCLECI_ROLE_ARN" --role-session-name deploy-test --duration-seconds 1800 > assumed-roles.json

# # Extract the temporary credentials from the assumed role response
# export AWS_ACCESS_KEY_ID=$(jq -r .Credentials.AccessKeyId assumed-roles.json)
# export AWS_SECRET_ACCESS_KEY=$(jq -r .Credentials.SecretAccessKey assumed-roles.json)
# export AWS_SESSION_TOKEN=$(jq -r .Credentials.SessionToken assumed-roles.json)

# # Update the kubeconfig for the specified EKS cluster
# aws eks update-kubeconfig --name "$EKS_CLUSTER" --region "$AWS_REGION" --profile playground

# # Clean up temporary role assumption file
# rm assumed-roles.json
# Access environment variables from CircleCI context directly
AWS_ROLE_ARN=arn:aws:iam::161826879607:role/EXT-mifosGroupIAMRole
AWS_REGION=eu-central-1
aws eks update-kubeconfig --name GStack-sb-eks-plg
helm upgrade --install -f helm/govstack-chart/values.yaml g2p-sandbox helm/govstack-chart --create-namespace  --namespace paymenthub
helm upgrade -f helm/fineract/values.yaml fineract helm/fineract --install --create-namespace --namespace fineract
# helm test g2p-sandbox -n paymenthub