variable "project_id" {
  description = "GCP project id"
  type        = string
  default     = "project-priya-477303"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "asia-south1-a"
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "primary-gke"
}
