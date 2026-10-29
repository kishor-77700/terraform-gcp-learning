# variables.tf

variable "project_id" {
  description = "The GCP project ID where resources will be created."
  type        = string
  default     = "kkgcplabs01-021"
}

variable "region" {
  description = "The GCP region for regional resources."
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Name of the GCS bucket to create. Must be globally unique."
  type        = string
}
