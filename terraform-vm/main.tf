
provider "google" {
  project = var.project_id
  region  = var.region
}

# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "instance-20260311-095319" {
  boot_disk {
    auto_delete = true
    device_name = var.instance_name

    initialize_params {
      image = var.disk_image
      size  = var.disk_size
      type  = var.disk_type
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = var.can_ip_forward
  deletion_protection = var.deletion_protection
  enable_display      = var.enable_display

  labels = var.labels

  machine_type = var.machine_type

  metadata = {
    startup-script = var.startup_script
  }

  name = var.instance_name

  network_interface {
    access_config {
      network_tier = var.network_tier
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = var.subnetwork
  }

  scheduling {
    automatic_restart   = var.automatic_restart
    on_host_maintenance = var.on_host_maintenance
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  shielded_instance_config {
    enable_integrity_monitoring = var.enable_integrity_monitoring
    enable_secure_boot          = var.enable_secure_boot
    enable_vtpm                 = var.enable_vtpm
  }

  tags = var.tags
  zone = var.zone
}