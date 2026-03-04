
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "instance-20260304-190348" {
  boot_disk {
    auto_delete = true
    device_name = var.instance_name

    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = var.can_ip_forward
  deletion_protection = var.deletion_protection
  enable_display      = var.enable_display

  labels = var.labels

  machine_type = var.machine_type
  name         = var.instance_name

  network_interface {
    access_config {
      network_tier = var.network_tier
    }

    queue_count = 0
    stack_type  = var.stack_type
    subnetwork  = "projects/${var.project_id}/regions/${var.region}/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
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