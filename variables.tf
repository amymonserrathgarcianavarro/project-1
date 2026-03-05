variable "region" {
  type        = string
  description = "Primary region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Primary zone"
  default     = "us-central1-a"
}


 variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "project-1-489205"
}

variable "network_name" {
  type        = string
  description = "VPC name"
  default     = "project1-vpc"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
  default     = "project1-subnet"
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR"
  default     = "10.10.0.0/16"
}

variable "gke_cluster_name" {
  type        = string
  description = "GKE cluster name"
  default     = "project1-gke"
}

variable "gke_nodepool_name" {
  type        = string
  description = "Default node pool name"
  default     = "default-pool"
}

variable "gke_machine_type" {
  type        = string
  description = "Machine type for nodes"
  default     = "e2-micro"
}

variable "gke_nodes_min" {
  type        = number
  description = "Min nodes"
  default     = 1
}

variable "gke_nodes_max" {
  type        = number
  description = "Max nodes"
  default     = 2
}