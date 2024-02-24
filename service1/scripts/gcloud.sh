# Do something for you deployment here
#!/bin/bash

# Desired Logic
# If Environement Variable does not exist then
# Check if Service Account Credentials are present
# Else error out on no token

if [[ -n "$GKE_CRED" ]]; then
  echo "Using GKE Service Account"
  mkdir -p ./creds
  echo $GKE_CRED > "./creds/gkeserviceaccount.json"
  export gke_cred_path="./creds/gkeserviceaccount.json"
else
  echo "GKE Service Account is not defined"
  exit 1
fi

if [[ -n "$GCP_PROJECT" ]]; then
  echo "Setting GCP Project as: $GCP_PROJECT"
else
  echo "GCP Project was not defined"
  exit 1
fi
if [[ -n "$GKE_SA" ]]; then
  echo "Setting GKE Service Account to as: $GKE_SA"
else
  echo "No GKE Service Account was provided"
  exit 1
fi

echo "Activating GCloud Service Account Auth using Creds path"
gcloud auth activate-service-account "$GKE_SA" --key-file="$gke_cred_path"
echo "Setting GCP Project"
gcloud config set project ${GCP_PROJECT}
gcloud container clusters get-credentials "$GKE_CLUSTER" --zone="$GCP_ZONE"
