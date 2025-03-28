# IAM policy for granting Cloud Functions invoker permissions to a specific Service Account
resource "google_project_iam_member" "cloud_function_invoker" {
  project = var.project_id
  role    = "roles/cloudfunctions.invoker"
  member  = "serviceAccount:${var.service_account_email}"
}
