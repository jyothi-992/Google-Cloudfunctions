variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "function_name" {
  description = "The name of the Cloud Function"
  default     = "hello-world-function"
  type        = string
}
