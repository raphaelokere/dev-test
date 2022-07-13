### Un-comment to use the following resource blocks to provision new Resource Groups, Vnets, Subnets ###
# resource "azurerm_resource_group" "rg" {
#   name     = var.azurerm_resource_group
#   location = var.azurerm_location
# }
# resource "azurerm_virtual_network" "vnet" {
#   name                = var.azurerm_vnet
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.azurerm_location
#   address_space       = var.address_space
# }
# resource "azurerm_subnet" "subnet" {
#   name                 = var.azurerm_subnet
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = var.address_prefixes
# }

### Datasource example for already existing resources ###

data "azurerm_resource_group" "rg" {
  name = "${var.azurerm_resource_group}"
}

data "azurerm_virtual_network" "vnet" {
  name = "${var.azurerm_vnet}"
  resource_group_name = "${var.azurerm_resource_group}"
}

data "azurerm_subnet" "subnet" {
  name = "${var.azurerm_subnet}"
  virtual_network_name = "${var.azurerm_vnet}"
  resource_group_name = "${var.azurerm_resource_group}"
}

module "virutal_machine" {
source = "git::https://H507669@bitbucket.honeywell.com/scm/~h507669/sps-pss-devsecops.git//sps-pss-w-azurevm"

  # Resource Group, location, VNet and Subnet details
  azurerm_resource_group             = data.azurerm_resource_group.rg.name # If creating Azure resources, change this input argument to azurerm_resource_group.rg.name
  azurerm_location                   = data.azurerm_resource_group.rg.location # If creating Azure resources, change this input argument to azurerm_resource_group.rg.location
  azurerm_vnet                       = data.azurerm_virtual_network.vnet.name # If creating Azure resources, change this input argument to azurerm_virtual_network.vnet.name
  azurerm_subnet                     = data.azurerm_subnet.subnet.name # If creating Azure resources, change this input argument to azurerm_subnet.subnet.name
  azurerm_vnet_subnet_resource_group = data.azurerm_resource_group.rg.name # If creating Azure resources, change this input argument to azurerm_resource_group.rg.name
  depends_on                         = [data.azurerm_subnet.subnet] # If creating Azure resources, change this input argument to [azurerm_subnet.subnet]

  #Placement group and availability sets
  azurerm_placement_group_name       = var.azurerm_placement_group_name
  azurerm_enable_vm_availability_set = true
  azurerm_availability_set_name      = var.azurerm_availability_set_name

  #Accelerated Network
  azurerm_enable_accelerated_networking = true

  # VM details
  azurerm_vm_name              = var.azurerm_vm_name
  azurerm_vm_count             = var.azurerm_vm_count
  azurerm_vm_size              = var.azurerm_vm_size
  azurerm_vm_os_disk_type      = var.azurerm_vm_os_disk_type
  azurerm_vm_managed_disk_type = var.azurerm_vm_managed_disk_type
  azurerm_vm_disk_size         = var.azurerm_vm_disk_size


  #User Details
  azurerm_vm_username = var.azurerm_vm_username
  azurerm_vm_password = var.azurerm_vm_password

  azurerm_enable_vm_data_disk = true
  azurerm_vm_data_disk_size   = var.azurerm_vm_data_disk_size
  azurerm_vm_data_disk_count  = var.azurerm_vm_data_disk_count

  tags = var.tags

}