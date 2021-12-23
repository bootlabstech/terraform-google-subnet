//required variables

variable "name" {
  description = "The name of the network being created"
  type        = string
}

variable "cidr_range" {
  description = "The range of internal addresses that are owned by this subnetwork"
  type        = string
}

variable "network_id" {
  description = "The id of the parent vnet"
  type        = string
}

variable "region" {
  description = "The region where the subnet will live"
  type        = string
}

variable "project" {
  description = "The project where the subnet will live"
  type        = string
}

variable "secondary_ip_range" {
  description = "An array of configurations for secondary IP ranges for VM instances contained in this subnetwork."
  type = list(object({
      range_name = string
      ip_cidr_range = string
  }))
}