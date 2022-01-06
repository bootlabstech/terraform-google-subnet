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

// optional variables
variable "description" {
  description = "The resource must be recreated to modify this field."
  type        = string
  default     = "the subnetwork created in the vpc"
}

variable "private_ip_google_access" {
  description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
  type        = bool
  default     = true
}

variable "enable_log_config" {
  description = "When enabled subnet flow logs will be pushed to stackdriver"
  type        = bool
  default     = true
}

variable "aggregation_interval" {
  description = "Can only be specified if VPC flow logging for this subnetwork is enabled. Toggles the aggregation interval for collecting flow logs. Increasing the interval time will reduce the amount of generated flow logs for long lasting connections. Default is an interval of 5 seconds per connection. Default value is INTERVAL_5_SEC. Possible values are INTERVAL_5_SEC, INTERVAL_30_SEC, INTERVAL_1_MIN, INTERVAL_5_MIN, INTERVAL_10_MIN, and INTERVAL_15_MIN."
  type        = string
  default     = "INTERVAL_15_MIN"
}

variable "flow_sampling" {
  description = "Can only be specified if VPC flow logging for this subnetwork is enabled. The value of the field must be in [0, 1]. Set the sampling rate of VPC flow logs within the subnetwork where 1.0 means all collected logs are reported and 0.0 means no logs are reported. Default is 0.5 which means half of all collected logs are reported."
  type        = number
  default     = 1
}

variable "metadata" {
  description = "Can only be specified if VPC flow logging for this subnetwork is enabled. Configures whether metadata fields should be added to the reported VPC flow logs. Default value is INCLUDE_ALL_METADATA. Possible values are EXCLUDE_ALL_METADATA, INCLUDE_ALL_METADATA, and CUSTOM_METADATA."
  type        = string
  default     = "INCLUDE_ALL_METADATA"
}

variable "metadata_fields" {
  description = "List of metadata fields that should be added to reported logs. Can only be specified if VPC flow logs for this subnetwork is enabled and "metadata" is set to CUSTOM_METADATA."
  type        = list(any)
  default     = []
}
