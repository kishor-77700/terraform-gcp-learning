# main.tf

terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a GCS bucket. A Google Cloud Storage bucket is a globally unique container for objects (files). This resource will provision an empty bucket with the name provided by var.bucket_name in the specified region.
resource "google_storage_bucket" "gcs_bucket" {
  name     = var.bucket_name
  location = var.region
  # Ensure the bucket is not deleted if Terraform state is removed unintentionally.
  force_destroy = false
  uniform_bucket_level_access = true
}
