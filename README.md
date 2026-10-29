# Terraform GCS Bucket Example

## Purpose

This repository is a simple learning project for **Terraform on Google Cloud Platform (GCP)**. It demonstrates how to declare a Google Cloud Storage (GCS) bucket using Terraform, organize the configuration with variables and outputs, and follow best‑practice workflow steps (init, fmt, validate, plan, apply, destroy).

## Prerequisites

- **Terraform** ≥ 1.0 (download from https://developer.hashicorp.com/terraform/downloads)
- **Google Cloud SDK** (`gcloud`) installed and authenticated, or a service‑account JSON key available via the `GOOGLE_APPLICATION_CREDENTIALS` environment variable.
- Access to a GCP project where you have permission to create Cloud Storage buckets.
- Basic knowledge of how Terraform works (providers, resources, variables, outputs).

> **Note**: The repository contains no real project IDs or secrets. You will supply the bucket name and (optionally) a project ID via variables.

## Usage

```bash
# 1️⃣ Initialise the working directory (download provider plugins)
terraform init -backend=false

# 2️⃣ Format the code (optional but recommended)
terraform fmt -recursive

# 3️⃣ Validate the configuration syntax
terraform validate

# 4️⃣ Preview the changes Terraform will make
terraform plan -var-file=terraform.tfvars -input=false

# 5️⃣ Apply the changes (creates the bucket)
#    **You run this step yourself – the assistant never runs `apply`.
terraform apply -var-file=terraform.tfvars -input=false

# 6️⃣ Destroy the bucket when you are finished (optional)
#    **You run this step yourself as well.
terraform destroy -var-file=terraform.tfvars -auto-approve
```

- The `terraform.tfvars` file contains the bucket name you wish to create, e.g.
  ```hcl
  bucket_name = "my-unique-bucket-kkgcplabs01-021"
  ```
- You can also supply the variable on the command line with `-var 'bucket_name=...'` if you prefer not to keep a tfvars file.

## File Structure

```
.
├── main.tf          # Provider configuration and the GCS bucket resource
├── variables.tf     # Input variables: project_id, region, bucket_name
├── outputs.tf       # Output values exposing the bucket name and self‑link
├── terraform.tfvars # (optional) concrete values for variables used by plan/apply
└── README.md        # This documentation file
```

## Resources

- **`google_storage_bucket.gcs_bucket`** – Creates a **Google Cloud Storage bucket**. The bucket name is supplied via the `bucket_name` variable and must be globally unique. The bucket is created in the region defined by the `region` variable (default `us-central1`).
  - `force_destroy = false` ensures the bucket cannot be accidentally deleted if it still contains objects.
  - The bucket uses the default `STANDARD` storage class.
  - Outputs expose the bucket's name (`bucket_name`) and its full self‑link URL (`bucket_self_link`).

## Important Project Rules

- **Never run `terraform apply` or `terraform destroy` from the assistant** – you execute those commands yourself.
- Run `terraform fmt` and `terraform validate` after any change to keep the code tidy and correct.
- Keep the configuration simple, using variables and outputs rather than hard‑coding values.
- Avoid creating compute‑heavy or high‑egress resources (the lab is suspended for abnormal outbound activity).

Happy Terraforming! 🚀