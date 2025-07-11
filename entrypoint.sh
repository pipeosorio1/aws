#!/bin/sh

echo "aws version" && \
aws --version && \
echo "eksctl version" && \
eksctl version && \
echo "kubectl version" && \
kubectl version --client && \
echo "helm version" && \
helm version && \
echo "k9s version" && \
k9s version

echo "Configurando AWS..."
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $AWS_REGION

aws eks update-kubeconfig --region "$AWS_REGION" --name "$EKS_CLUSTER"

echo "Contenedor listo"
exec "$@"