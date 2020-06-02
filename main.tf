
resource "random_pet" "this" {
  length = 2
}

locals {
  name      = var.name == "" ? random_pet.this.id : var.name
  public_ip = var.public_ip == "" ? join("", data.google_compute_address.this.*.address) : var.public_ip
}

data "google_compute_address" "this" {
  count = var.id == "" ? 0 : 1
  name  = var.id
}

data "google_compute_image" "ubuntu" {
  family  = "ubuntu-minimal-1804-lts"
  project = "ubuntu-os-cloud"
}

module "user_data" {
  source = "github.com/insight-icon/terraform-aws-icon-user-data"
}

resource "google_compute_instance" "this" {
  count  = var.create ? 1 : 0
  labels = var.labels
  tags   = var.tags

  machine_type = var.instance_type
  name         = var.node_name
  zone         = var.zone

  metadata_startup_script = module.user_data.user_data
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  service_account {
    email  = var.security_group_id
    scopes = ["cloud-platform"]
  }

  boot_disk {
    auto_delete = true

    initialize_params {
      size = var.root_volume_size
      # TODO: List different HD types
      type  = "pd-standard"
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    subnetwork = var.public_subnet_id

    access_config {
      nat_ip = local.public_ip
    }
  }

  network_interface {
    subnetwork = var.private_subnet_id
  }
}


module "ansible" {
  source           = "github.com/insight-infrastructure/terraform-aws-ansible-playbook.git?ref=v0.10.0"
  create           = var.create
  ip               = var.public_ip
  user             = "ubuntu"
  private_key_path = var.private_key_path

  playbook_file_path = "${path.module}/ansible/main.yml"
  playbook_vars = merge({
    keystore_path     = var.keystore_path
    keystore_password = var.keystore_password
    network_name      = var.network_name
    main_ip           = local.public_ip
    dhcp_ip           = join("", google_compute_instance.this.*.network_interface.0.access_config.0.nat_ip)
    ansible_hardening = var.ansible_hardening
  }, var.playbook_vars)

  requirements_file_path = "${path.module}/ansible/requirements.yml"
}

