terraform {
  required_version = ">= 1.5.0"

  backend "gcs" {
    bucket = "tfstate-project-1-489205"
    prefix = "project-1/infra"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}