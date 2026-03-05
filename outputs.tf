output "project_id" {
  value = var.project_id
}

output "region" {
  value = var.region
}

output "gke_cluster_name" {
  value = google_container_cluster.gke.name
}

output "gke_cluster_location" {
  value = google_container_cluster.gke.location
}

output "vpc_name" {
  value = google_compute_network.vpc.name
}