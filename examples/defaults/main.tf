variable "vpc_name" {}
variable "public_key_path" {}
variable "private_key_path" {}

locals {
  keystore_path = "${path.cwd}/../../test/fixtures/keystore-min-specs"
}

module "network" {
  source   = "github.com/insight-icon/terraform-icon-gcp-network.git?ref=master"
  vpc_name = var.vpc_name
  project  = var.gcp_project
  region   = var.gcp_region
}

//module "registration" {
//  source   = "github.com/insight-icon/terraform-icon-gcp-registration.git?ref=master"
//  network_name = "testnet"
//
//  organization_name    = "Insight-CI1-gcp"
//  organization_country = "USA"
//  organization_email   = "fake@gmail.com"
//  organization_city    = "CircleCI"
//  organization_website = "https://google.com"
//
//  keystore_password = "testing1."
//  keystore_path     = local.keystore_path
//}

resource "random_pet" "this" {}

resource "google_compute_address" "this" {
  name = random_pet.this.id
}

module "defaults" {
  source            = "../.."
  private_subnet_id = module.network.private_subnets[0]
  public_subnet_id  = module.network.public_subnets[0]
  security_group_id = module.network.sentry_security_group_id[0]


  //  public_ip = module.registration.public_ip
  public_ip = google_compute_address.this.id


  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path

  create           = true
  create_eip       = true
  root_volume_size = "70"
}
