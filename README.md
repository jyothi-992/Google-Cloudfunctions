**Instructions to Deploy and Destroy the Infrastructure**
# GCP "Hello World" Application

## Prerequisites
- Google Cloud Project
- Google Cloud SDK installed (or use GCP Cloud Shell)
- Terraform installed (or use Cloud Shell)

## Deployment Steps

1. Clone the repository or create a new directory for Terraform configuration.

2. Update `provider.tf` with your project ID.

3. Initialize Terraform:
terraform init

4. Review the plan:
terraform plan

5. Apply the configuration:
terraform apply
Once Terraform applies the changes, you will receive the load balancer IP address and Cloud Function URL as outputs.

Test the application by accessing the Cloud Function via the Load Balancer IP:
curl http://<LOAD_BALANCER_IP>
