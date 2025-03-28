# modules/load_balancer/main.tf

# Define the Network Endpoint Group for the Cloud Function (Serverless NEG)
resource "google_compute_network_endpoint_group" "serverless_neg" {
  name     = "serverless-neg"
  network  = "default"  # You can specify a different network if needed
  project  = var.project_id

  # Define the serverless endpoint to link the Cloud Function
  serverless_network_endpoint {
    function = module.cloud_function.function_name  # Link to Cloud Function module
  }
}

# Create the backend service to route traffic to the Cloud Function via Serverless NEG
resource "google_compute_backend_service" "backend_service" {
  name                  = "backend-service"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_http_health_check.health_check.id]

  backend {
    group = google_compute_network_endpoint_group.serverless_neg.self_link  # Link to the Serverless NEG
  }
}

# Health check configuration
resource "google_compute_http_health_check" "health_check" {
  name                = "health-check"
  request_path        = "/health"
  port                = 80
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
}

# URL Map to route requests to the backend service
resource "google_compute_url_map" "url_map" {
  name = "url-map"

  default_url_redirect {
    https_redirect = true
    strip_query    = true
  }

  default_route_action {
    url_rewrite {
      path_prefix_rewrite = "/"
    }
  }

  host_rule {
    hosts        = ["*"]
    path_matcher = google_compute_path_matcher.path_matcher.name
  }
}

# Path matcher for URL routing
resource "google_compute_path_matcher" "path_matcher" {
  name            = "path-matcher"
  default_service = google_compute_backend_service.backend_service.self_link
}

# Target HTTP Proxy to route traffic to URL map
resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "http-proxy"
  url_map = google_compute_url_map.url_map.self_link
}

# Global address for the load balancer IP
resource "google_compute_global_address" "lb_ip" {
  name = "load-balancer-ip"
}

# HTTP forwarding rule to route traffic to the proxy
resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name       = "http-forwarding-rule"
  port_range = "80"
  target     = google_compute_target_http_proxy.http_proxy.self_link
  ip_address = google_compute_global_address.lb_ip.address
}
