# Setup of Continuos Integration

Those notes are a remindinder of the steps executed to build our CI environment.

## Overview

We have a stable test environment on AWS/GCloud/Azure  with:

- in AWS, a domain (nuvtest.net) with subzones. A subzone (oshgcp.nuvest.test) is on GCP, others in AWS
- in AWS, an EKS cluster
- in Gcloud, a GKE cluster
- in Gcloud, an OpenShift cluster 
- in Gcloud, a virtual machine k3s-test and mk8s-test
- in Azure, an AKS cluster

# Setup

## Prereq

You to isntall a few tools:

- [`task`](taskfile.dev)
- `aws` cli
- `azure` cli 
- `gcloud` cli 

## Permissions in AWS

Generated an user with admin power and extacted the Access and Secret Key 

## Permissions on Gcloud

- Enabled the services required:

```
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable dns.googleapis.com
gcloud services enable iamcredentials.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable servicemanagement.googleapis.com
gcloud services enable serviceusage.googleapis.com
gcloud services enable storage-api.googleapis.com
gcloud services enable storage-component.googleapis.com
gcloud services enable deploymentmanager.googleapis.com
gcloud services enable resourcemanager.projects.delete
```

Also manually  enabled Kubernetes cluster creation and IAM management

-  Generated a service account for GCloud with administrative power. 

The service account email available in: https://console.cloud.google.com/iam-admin/serviceaccounts, assigned the role "Owner" to the service account, then extracted the json for the service account:

```
gcloud iam service-accounts keys create ~/.ssh/gcloud.json --iam-account=<account-email>
```

## SSH 

- Generate a id_rsa and and id_rsa.key,
stored in ~/.ssh/id_rsa and ~/.id_rsa.pub

# DNS

- Created the zone `oshgcp.nuvtest.net` in Gcloud

- Created the following zones in AWS Route53
  - k3s.nuvtest.net
  - mk8s.nuvtest.net
  - eks.nuvtest.net
  - aks.nuvtest.net 
  - gke.nuvtest.net 

- Registered a domain in AWS (nuvtest.net) and delegated all the subzones.

# OpenShift

- Created conf/gcp-install-config.yaml and conf/aws-install-config.yaml

First running the openshift-install and then manually tweaked the configuration.

Note you need:
- an id_rsa.pub
- for gcloud, the service account file 
- the dns zone ub GCP we created (oshgcp.nuvtest.net)
- the pullSecret for OKD (open source openshift) as follows: 

```
{"auths":{"fake":{"auth":"aWQ6cGFzcwo="}}}
```

# Configure variables

Configure `env` copying it from env.dit and filling it with all the required secrets.

# Create all the clusters and vms

Once everything is configured we can build all the clusters:

- `task k3s:create`
- `task mk8s:create`
- `task gke:create`
- `task aks:create`
- `task eks:create`
- `task osh:create`

*NOTE*: many parameters are wired in the taskfiles: look for the `*:config` tasks in `Taskfile*.yml` if you want to tune them.

# Upload the secrets

Once you created the clusters, you can upload their kubeconfig or ip as secrets to GitHub with:

- `task upload-secrets`
