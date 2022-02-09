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
  description = <<-EOT
    {
   "type": "json",
   "purpose": "autocomplete",
   "data":[ "asia-east1",
        "asia-east2",
        "asia-northeast1",
        "asia-northeast2",
        "asia-northeast3",
        "asia-south1",
        "asia-south2",
        "asia-southeast1",
        "asia-southeast2",
        "australia-southeast1",
        "australia-southeast2",
        "europe-central2",
        "europe-north1",
        "europe-west1",
        "europe-west2",
        "europe-west3",
        "europe-west4",
        "europe-west6",
        "northamerica-northeast1",
        "northamerica-northeast2",
        "southamerica-east1",
        "southamerica-west1",
        "us-central1",
        "us-east1",
        "us-east4",
        "us-west1",
        "us-west2",
        "us-west3",
        "us-west4"
    ],
   "description": "regions used for deployment"
}
  EOT
  type        = string
}

variable "project" {
  description =  "project ID"
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
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
    true,
    false
   ],
   "default":false,
   "description": "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
EOT
  type        = bool
  default     = true
}

variable "enable_log_config" {
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
    true,
    false
   ],
   "default":false,
   "description": "When enabled subnet flow logs will be pushed to stackdriver"
}
EOT 
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
  description = "List of metadata fields that should be added to reported logs. Can only be specified if VPC flow logs for this subnetwork is enabled and metadata is set to CUSTOM_METADATA."
  type        = list(any)
  default     = []
}
