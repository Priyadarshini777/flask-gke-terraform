resource "google_compute_network" "vpc" {
  name = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "custom-vpc-subnet"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.0.0/16"
}

resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "backend-repo"
  format        = "DOCKER"
  description   = "Docker repo for backend images"
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  network  = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.id

  remove_default_node_pool = true
  ip_allocation_policy {}
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  location = var.region
  cluster  = google_container_cluster.primary.name
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
