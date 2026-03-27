variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "rg-vm-example"
}

variable "location" {
  description = "Azure region where all resources will be deployed."
  type        = string
  default     = "West Europe"
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "vnet-vm-example"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
  default     = "snet-vm-example"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "nsg_name" {
  description = "Name of the network security group."
  type        = string
  default     = "nsg-vm-example"
}

variable "allowed_ssh_source_cidr" {
  description = "CIDR block allowed to reach the VM over SSH (port 22). Restrict to a trusted IP range in production."
  type        = string
  default     = "*"
}

variable "public_ip_name" {
  description = "Name of the public IP address."
  type        = string
  default     = "pip-vm-example"
}

variable "nic_name" {
  description = "Name of the network interface."
  type        = string
  default     = "nic-vm-example"
}

variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
  default     = "vm-example"
}

variable "vm_size" {
  description = "Size (SKU) of the virtual machine."
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Administrator username for the virtual machine."
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  description = "SSH public key for the administrator account. Provide the contents of your public key file (e.g. ~/.ssh/id_rsa.pub)."
  type        = string
}

variable "os_disk_caching" {
  description = "Caching type for the OS disk."
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS disk."
  type        = string
  default     = "Standard_LRS"
}

variable "image_publisher" {
  description = "Publisher of the VM image."
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the VM image."
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "SKU of the VM image."
  type        = string
  default     = "22_04-lts-gen2"
}

variable "image_version" {
  description = "Version of the VM image."
  type        = string
  default     = "latest"
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}
