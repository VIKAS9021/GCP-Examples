variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "test-instance-20260304-190348"
}

variable "boot_disk_image" {
  description = "Boot disk image for the compute instance"
  type        = string
  default     = "projects/debian-cloud/global/images/debian-12-bookworm-v20260210"
}

variable "boot_disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

variable "boot_disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "pd-balanced"
}

variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "Zone where the instance will be deployed"
  type        = string
  default     = "asia-south1-a"
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "divine-ceremony-167109"
}

variable "region" {
  description = "GCP region for the subnetwork"
  type        = string
  default     = "asia-south1"
}

variable "network_tier" {
  description = "Network tier for the access config"
  type        = string
  default     = "PREMIUM"
}

variable "stack_type" {
  description = "Stack type for the network interface"
  type        = string
  default     = "IPV4_ONLY"
}

variable "service_account_email" {
  description = "Service account email for the compute instance"
  type        = string
  default     = "992070314277-compute@developer.gserviceaccount.com"
}

variable "service_account_scopes" {
  description = "List of service account scopes"
  type        = list(string)
  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"
  ]
}

variable "tags" {
  description = "Network tags for the instance"
  type        = list(string)
  default     = ["allow-web-traffic"]
}

variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
  default = {
    goog-ec-src = "vm_add-tf"
  }
}

variable "can_ip_forward" {
  description = "Whether to allow IP forwarding"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled"
  type        = bool
  default     = false
}

variable "enable_display" {
  description = "Whether to enable display"
  type        = bool
  default     = false
}

variable "enable_secure_boot" {
  description = "Whether to enable secure boot"
  type        = bool
  default     = true
}

variable "enable_vtpm" {
  description = "Whether to enable vTPM"
  type        = bool
  default     = true
}

variable "enable_integrity_monitoring" {
  description = "Whether to enable integrity monitoring"
  type        = bool
  default     = true
}