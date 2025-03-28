**Instructions to Deploy and Destroy the Infrastructure**
**Important Notes**
Function Source: The Cloud Function source code (function-source.zip) should be uploaded to a Google Cloud Storage bucket (gs://your-bucket-name), which is referenced in the Cloud Function module.

IAM Configuration: The IAM module grants permissions to a service account to invoke the Cloud Function.

Load Balancer: The Load Balancer is configured to route traffic to the Cloud Function. It’s set to expose the Cloud Function via HTTP(S).

Security: Make sure the IAM roles are correctly assigned to ensure only authorized users or services can invoke the Cloud Function.

# GCP "Hello World" Application

## Prerequisites
- Google Cloud Project
- Google Cloud SDK installed (or use GCP Cloud Shell)
- Terraform installed (or use Cloud Shell)

## Deployment Steps

1. Clone the repository or create a new directory for Terraform configuration.

2. Update `terrafor.tfvars` with your project ID, and all other parameters.

3. Initialize Terraform:
terraform init

4. Review the plan:
terraform plan

5. Apply the configuration:
terraform apply
Once Terraform applies the changes, you will receive the load balancer IP address and Cloud Function URL as outputs.

Test the application by accessing the Cloud Function via the Load Balancer IP:
curl http://<LOAD_BALANCER_IP>
