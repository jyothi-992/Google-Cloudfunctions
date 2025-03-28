# variables.tf

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for resources"
  type        = string
}

variable "function_name" {
  description = "The name of the Cloud Function"
  default     = "hello-world-function"
  type        = string
}

variable "bucket_name" {
  description = "Name of the Cloud Storage bucket"
  default     = "source-bucket"
  type        = string
}

variable "function_url" {
  description = "The URL of the cloud function."
  type        = string
}
# The email of the service account to be granted invoker role
variable "service_account_email" {
  description = "The email address of the service account"
  type        = string
}

variable "function_zip_path" {
  description = "Path to the ZIP file containing the Cloud Function code"
  type        = string
}
