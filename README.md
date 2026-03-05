Project 1 — GCP + Terraform + GKE Lab

This repository contains a hands-on Google Cloud Platform (GCP) lab built with Terraform, focused on learning core Networking (VPC) and Kubernetes (GKE) fundamentals in a practical, structured way.

It is designed as a foundation for a DevOps/Cloud roadmap where later stages will add CI/CD (Jenkins) and application deployments using Helm.

What this project creates (Terraform)

Running terraform apply provisions the following resources:

Networking

A custom VPC (no auto-created subnetworks)

A regional subnet in us-central1 using CIDR 10.10.0.0/16

Firewall rules:

Internal traffic within the VPC

HTTP/HTTPS (80/443)

SSH (22) (lab-only; should be restricted in production)

Kubernetes (GKE)

A GKE cluster in region us-central1

A node pool with 1 node (configurable), using e2-micro to keep the lab low-cost

A node Service Account with basic logging/monitoring permissions

Terraform Backend

Uses Google Cloud Storage (GCS) as a remote backend to store Terraform state in:

tfstate-project-1-489205

Requirements

gcloud installed and authenticated, pointing to the correct project

Terraform installed

Permissions to create resources in the target GCP project

Usage
1) Initialize Terraform
terraform fmt
terraform init
terraform validate
2) Review the plan
terraform plan
3) Create resources
terraform apply
4) Connect to the cluster
gcloud container clusters get-credentials project1-gke --region us-central1 --project project-1-489205
kubectl get nodes
5) Destroy resources (stop costs)
terraform destroy

Recommendation: ensure deletion_protection = false is set on the GKE cluster resource so Terraform can destroy it cleanly.

Cost note

This lab aims to minimize costs by using a small node pool (e2-micro). However, GKE and Compute resources may still generate charges while active. To avoid unexpected costs, run terraform destroy when you are done.

Roadmap / Next Steps

Add Artifact Registry and image build/push workflow

Deploy an application to GKE with Helm

Install Jenkins (lightweight setup) and create CI/CD pipelines:

Infra pipeline (Terraform plan/apply)

App build/test

Deploy to GKE
