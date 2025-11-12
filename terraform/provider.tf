terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "google" {
  credentials = file("/tmp/gcloud-key.json") # 👈 add this line
  project     = var.project_id
  region      = var.region
}
