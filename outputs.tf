output "public_subnet_id" {
  value = var.public_subnet_id
}

output "private_subnet_id" {
  value = var.public_subnet_id
}

output "security_group_id" {
  value = var.security_group_id
}

output "instance_id" {
  value = join("", google_compute_instance.this.*.self_link)
}

output "public_ip" {
  value = var.public_ip
}

output "private_ip" {
  value = join("", google_compute_instance.this.*.network_interface.1.network_ip)
}

output "user_data" {
  value = module.user_data.user_data
}