# backend.tf

terraform {
  backend "gcs" {
    bucket = "tf-state-bucket-assessment"
    prefix = "GCF-terraform/state"
  }
}
