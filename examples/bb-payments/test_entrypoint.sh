#!/bin/bash
kubectl get pods -n paymenthub
helm test ph-ee-g2psandbox -n paymenthub --timeout 5m
# no_output_timeout=900

