variable "create" {
  description = "Boolean to make module or not"
  type        = bool
  default     = true
}

########
# Label
########
variable "id" {
  description = "The id of the deployment"
  type        = string
  default     = ""
}

variable "tags" {
  description = "List of tags"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Map of labels"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name of the resources"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "The network name, ie kusama / mainnet"
  type        = string
  default     = "testnet"
}


###################
# NETWORK VARIABLES
###################
variable "public_ip" {
  description = "The public IP, leave blank to query IP from name (bucket name by default in registration)"
  type        = string
  default     = ""
}

variable "public_subnet_id" {
  description = "The id of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "The id of the private subnet"
  type        = string
}

variable "security_group_id" {
  description = "The id of the security group to run in"
  type        = string
}

##########
# Instance
##########
variable "node_name" {
  description = "Name of the node"
  type        = string
  default     = ""
}

variable "zone" {
  description = "The GCP zone to deploy in"
  type        = string
  default     = "us-east1-b"
}

variable "monitoring" {
  description = "Boolean for cloudwatch"
  type        = bool
  default     = false
}

variable "create_eip" {
  description = "Boolean to create elastic IP"
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = string
  default     = 0
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "n1-standard-1"
}

variable "public_key_path" {
  description = "The path to the public ssh key"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The name of the preexisting key to be used instead of the local public_key_path"
  type        = string
  default     = ""
}

#########
# Ansible
#########
variable "private_key_path" {
  description = "The path to the private ssh key"
  type        = string
  default     = ""
}

variable "ansible_hardening" {
  description = "Run hardening roles"
  type        = bool
  default     = false
}

variable "playbook_vars" {
  description = "Additional playbook vars"
  type        = map(string)
  default     = {}
}

variable "keystore_path" {
  description = "The path to the keystore"
  type        = string
  default     = ""
}

variable "keystore_password" {
  description = "The password to the keystore"
  type        = string
  default     = ""
}

