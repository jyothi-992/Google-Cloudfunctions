# Include modules

# Define the Network module to create networking resources
module "network" {
  source      = "./modules/network"
  project_id  = var.project_id
  region      = var.region
}
# Define the Cloud Function module to create the function
module "cloud_function" {
  source        = "./modules/cloud_function"
  project_id    = var.project_id
  region        = var.region
  function_name = var.function_name
}
# Define the Load Balancer module and pass the Cloud Function's URL to it
module "load_balancer" {
  source      = "./modules/load_balancer"
  project_id  = var.project_id
  region      = var.region
  function_url = module.cloud_function.function_url  # Passing the Cloud Function URL to the Load Balancer module
}
# Define the IAM module to grant permissions to the service account
module "iam" {
  source      = "./modules/iam"
  project_id  = var.project_id
  service_account_email = var.service_account_email
}
