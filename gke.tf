resource "google_container_cluster" "gke" {
  name     = var.gke_cluster_name
  location = var.region

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
  deletion_protection = false

  # Quitamos el node pool default para manejarlo aparte
  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  # VPC-native (recomendado)
  ip_allocation_policy {}
}

resource "google_container_node_pool" "default_pool" {
  name     = var.gke_nodepool_name
  location = var.region
  cluster  = google_container_cluster.gke.name

  # Para e2-micro: 1 nodo fijo (costo controlado)
  node_count = 1

  node_config {
    machine_type    = var.gke_machine_type
    service_account = google_service_account.gke_sa.email

    # Disco más barato/pequeño para lab
    disk_type    = "pd-standard"
    disk_size_gb = 20

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool = "default"
    }
  }
}