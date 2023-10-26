#!/bin/bash
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
role_arn: "arn:aws:iam::161826879607:role/EXT-mifosGroupIAMRole"
region: AWS_REGION
profile_name: "playground"
role_session_name: deploy-test
session_duration: '1800'
helm upgrade --install -f helm/govstack-chart/values.yaml g2p-sandbox helm/govstack-chart --create-namespace  --namespace paymenthub
helm upgrade -f helm/fineract/values.yaml fineract helm/fineract --install --create-namespace --namespace fineract
# helm test g2p-sandbox -n paymenthub
