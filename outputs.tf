# outputs.tf


output "load_balancer_ip" {
  description = "The IP address of the Load Balancer"
  value       = module.load_balancer.load_balancer_ip
}

output "cloud_function_url" {
  #value = "http://${google_compute_global_address.lb_ip.address}/"
  value = "http://${module.load_balancer.load_balancer_ip}/"
}
