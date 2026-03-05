provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google" {
  alias   = "zonal"
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


