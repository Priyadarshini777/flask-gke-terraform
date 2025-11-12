output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}

output "gke_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.repo.id
}
