resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.name
  ip_cidr_range = var.cidr_range
  region        = var.region
  network       = var.network_id
  
  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_range
    content {
      range_name = secondary_ip_range.range_name
      ip_cidr_range = secondary_ip_range.ip_cidr_range
    }
  }
}