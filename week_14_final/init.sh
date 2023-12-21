#!/bin/bash

# Install Helm.
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Set KUBECONFIG.
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Add and update Helm repositories.
helm repo add jenkins https://charts.jenkins.io
helm repo add https://kubernetes.github.io/ingress-nginx
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

# Install NGINX proxy using Helm.
helm upgrade --install ingress-nginx ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --values yaml/ingress-value.yaml \
  --version "4.8.4" \
  --wait

# Create namespace for Jenkins.
kubectl create ns jenkins

# Apply service account for Kubernetes secret provider.
kubectl apply -f /tmp/jenkins-service-account.yaml -n jenkins

# Apply GitHub personal access token for Jenkins.
kubectl apply -f /tmp/github-personal-token.yaml -n jenkins

# Apply GitHub server(system) pat secret for Jenkins.
kubectl apply -f /tmp/github-pat-secret-text.yaml -n jenkins

# Install Jenkins using Helm.
helm upgrade -i jenkins jenkins/jenkins -n jenkins --create-namespace \
  -f /tmp/jenkins-values.yaml --version "4.6.1"

# Install ArgoCD.
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f /tmp/argocd-dashboard-ingress.yaml -n argocd

# Install Crossplane using Helm.
helm upgrade -i crossplane \
--namespace crossplane-system \
--create-namespace crossplane-stable/crossplane \
--version "1.14.0" \
--wait

kubectl apply -f /tmp/tf-provider.yaml -n crossplane-system

kubectl apply -f /tmp/argocd-applicationset.yaml -n argocd
