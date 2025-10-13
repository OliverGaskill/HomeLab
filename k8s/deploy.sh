#!/bin/bash
# Deploy latest GitHub build to Minikube

set -e

# 1️⃣ Make sure you're authenticated with GitHub CLI
# Run `gh auth login` if you haven’t yet

# 2️⃣ Download the latest image artifact
echo "Downloading image artifact..."
gh run download -n my-frontend-image

# 3️⃣ Load the image into Minikube
echo "Loading image into Minikube..."
minikube image load image.tar

# 4️⃣ Apply Kubernetes manifests
echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yml

# 5️⃣ Wait for rollout
kubectl rollout status deployment/my-frontend

# 6️⃣ Get the service URL
minikube service my-frontend-service --url
