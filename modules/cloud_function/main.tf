resource "google_cloudfunctions_function" "hello_world" {
  name        = var.function_name
  runtime     = "python39"  # Python 3.9 runtime  # Runtime environment for the Cloud Function
  entry_point = "hello_world" # Entry point for the function (the function within the code)
  region      = var.region    # Define the region where the function will be deployed
 
# Point to the source archive in Cloud Storage
# Specify the Cloud Storage bucket and object (ZIP file) that contains the Cloud Function's code
  source_archive_bucket = "run-sources-assessment-test-project-454506-us-central1" # Cloud Storage bucket
  source_archive_object = "function-source/function-source.zip"  # Path to zip in Cloud Storage
# Allocate memory and define environment variables
  available_memory_mb = 128
  environment_variables = {
    FUNCTION_ENV = "test"
  }
}

# Output the function URL for use in other modules
output "function_url" {
  value = google_cloudfunctions_function.hello_world.https_trigger_url
}


