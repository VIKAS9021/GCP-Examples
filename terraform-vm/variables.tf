variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "instance-20260311-095319"
}

variable "disk_image" {
  description = "Boot disk image for the instance"
  type        = string
  default     = "projects/debian-cloud/global/images/debian-12-bookworm-v20260310"
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "pd-balanced"
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "GCP zone where the instance will be created"
  type        = string
  default     = "asia-south1-c"
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "divine-ceremony-167109"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-south1"
}

variable "subnetwork" {
  description = "Subnetwork self-link for the network interface"
  type        = string
  default     = "projects/divine-ceremony-167109/regions/asia-south1/subnetworks/default"
}

variable "network_tier" {
  description = "Network tier for the access config"
  type        = string
  default     = "PREMIUM"
}

variable "service_account_email" {
  description = "Service account email for the instance"
  type        = string
  default     = "992070314277-compute@developer.gserviceaccount.com"
}

variable "service_account_scopes" {
  description = "List of OAuth scopes for the service account"
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

variable "startup_script" {
  description = "Startup script to run on instance boot"
  type        = string
  default     = "#! /bin/bash\napt update\napt -y install apache2\ncat <<EOF > /var/www/html/index.html\n<html><body><p>Linux startup script added directly.</p></body></html>\nEOF"
}

variable "tags" {
  description = "Network tags to apply to the instance"
  type        = list(string)
  default     = ["http-server", "https-server"]
}

variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
  default = {
    goog-ec-src = "vm_add-tf"
  }
}

variable "can_ip_forward" {
  description = "Whether to allow IP forwarding on the instance"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Enable deletion protection on the instance"
  type        = bool
  default     = false
}

variable "enable_display" {
  description = "Enable virtual display on the instance"
  type        = bool
  default     = false
}

variable "automatic_restart" {
  description = "Whether the instance should be automatically restarted"
  type        = bool
  default     = true
}

variable "on_host_maintenance" {
  description = "Defines the maintenance behavior for the instance"
  type        = string
  default     = "MIGRATE"
}

variable "enable_integrity_monitoring" {
  description = "Enable integrity monitoring for shielded instance"
  type        = bool
  default     = true
}

variable "enable_secure_boot" {
  description = "Enable secure boot for shielded instance"
  type        = bool
  default     = false
}

variable "enable_vtpm" {
  description = "Enable vTPM for shielded instance"
  type        = bool
  default     = true
}