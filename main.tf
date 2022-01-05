resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.name
  description   = var.description
  ip_cidr_range = var.cidr_range
  region        = var.region
  network       = var.network_id
  project       = var.project
  
  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_range
    content {
      range_name = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
}
