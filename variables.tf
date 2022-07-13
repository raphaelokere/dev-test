# Must have an existing Service Principal for resource creation. If not, contact SPS-PSS-DevOps to create.
variable "subscription_id" {
  description = "Subscription ID"
  default     = "c0f4ab90-77d1-4389-9742-7f26b81fa2a2"
}

variable "client_id" {
  description = "Application ID"
  default     = "43c6f9d6-1c22-4117-986d-8653e81d0a06"
}

variable "client_secret" {
  description = "Client Secret"
  default     = "XJ48Q~7ninxLbwerkAGWIC1g.vpJZxAMCjnVYaZf"
}

variable "tenant_id" {
  description = "Directory (Tenant) ID"
  default     = "96ece526-9c7d-48b0-8daf-8b93c90a5d18"
}

variable "azurerm_location" {
  description = "Location for the resource"
}

variable "azurerm_resource_group" {
  description = "Name of the resource group"
  type        = string
}

variable "azurerm_vnet" {
  description = "vnet"
  type        = string
}

variable "azurerm_placement_group_name" { 
  description = "Placement group for VMs, per policy"
  default = "epm_placement_group"
  
}

variable "azurerm_availability_set_name" {
  description = "Availability set name"
  default = "epm_availability_set"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.1.0.0/16"]
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes that is used by the virtual network."
  default     = ["10.1.1.0/24"]
}

variable "azurerm_subnet" {
  description = "subnet"
  type        = string
}

variable "azurerm_vm_count" {
  type        = number
  description = "Number of VMs to create"
}

variable "azurerm_vm_name" {
  description = "Name for Virtual Machine"
}

variable "azurerm_vm_os_disk_type" {
  description = "OS Disk Type"
  default     = "Standard_LRS"
}

variable "azurerm_vm_managed_disk_type" {
  description = "Managed disk type"
  default     = "Standard_LRS"
}

variable "azurerm_vm_disk_size" {
  description = "Size needed for OS Disk (GB)"
  type        = number
  default     = 256
}

variable "azurerm_vm_data_disk_size" {
  description = "VM data disk size"
  type = number
  default = 256
}

variable "azurerm_vm_data_disk_count" {
  type = number
  default = 1
}

variable "azurerm_vm_size" {
  description = "Size of VM" # Refer to https://docs.microsoft.com/en-us/azure/virtual-machines/sizes for specs
  default     = "Standard_DS1_v2"
}

variable "licence_type" {
  type    = string
  default = "Windows_Server"
}

variable "azurerm_image_id" {
  description = "Shared Image Gallery - Image Resource Id"
  type        = string
  default     = null
}

variable "azurerm_vm_username" {
  description = "Admin username for VM"
  type        = string
}

variable "azurerm_vm_password" {
  description = "Admin password for VM"
  type        = string
}

variable "tags" {
  description = "Corporate mandated tagging for each VM"
  type        = map(string)
  default = {
    resourcecontact          = "raphael.okere@honeywell.com"
    financecode              = "100136 - CORP CORP CORP US"
    sbg                      = "SPS-PSS"
    product                  = "ConnectedWorker"
    productcategory          = "PSSOfferingExample"
    environment              = "dev"
    applicationservicenumber = "asn0000000"
  }
}