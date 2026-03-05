 resource "google_compute_network" "vpc" {
  name                    = var.network_name
  auto_create_subnetworks  = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.subnet_cidr
  private_ip_google_access = true
}