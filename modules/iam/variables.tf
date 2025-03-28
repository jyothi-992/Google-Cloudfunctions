# modules/iam/variables.tf

# The project ID where the IAM policies will be applied.
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

# The email address of the service account that will be granted the Cloud Functions Invoker role.
variable "service_account_email" {
  description = "The email address of the service account"
  type        = string
}
