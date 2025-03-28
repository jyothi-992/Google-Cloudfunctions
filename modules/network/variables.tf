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
variable "bucket_name" {
  description = "Name of the Cloud Storage bucket"
  default     = "source-bucket"
  type        = string
}
#variable "function_url" {
#  description = "The URL of the cloud function."
#  type        = string
#}
