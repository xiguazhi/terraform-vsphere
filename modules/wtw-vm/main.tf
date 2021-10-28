locals {
  environment = "dev"
  application_name = "actions"
}

module "wtw-onprem-windows"{
  source            = "Terraform-VMWare-Modules/vm/vsphere"
  count             = var.env[local.environment].instances
  vmname              = format("${var.env[local.environment].app_prefix}${var.namefmt}-${var.application_name}", count.index + 1)
  version           = "3.4.0"
  dc                = var.env[local.environment].dc
  vmrp              = var.env[local.environment].vmrp #Works with ESXi/Resources
  vmfolder          = var.env[local.environment].vmfolder #Works with ESXi/Resources
  datastore_cluster = var.env[local.environment].ds_cluster #You can use datastore variable instead
  vmtemp            = "RandomWindowsTemplate"
  instances         = var.env[local.environment].instances
  domain            = "bsorenson.io" #MAKE SURE YOU UPDATE VARIABLES TO ALIGN WITH ***YOUR*** ENVIRONMENT
  network = {
    "Server Network" = var.ipv4_address # To use DHCP create Empty list ["",""]
  }
  scsi_bus_sharing = "physicalSharing" // The modes are physicalSharing, virtualSharing, and noSharing
  scsi_type        = "pvscsi"        // Other acceptable value "pvscsi"
  scsi_controller  = 0                 // This will assign OS disk to controller 0
  dns_server_list  = var.env[local.environment].dns_server_list
  vmgateway        = var.ipv4_gateway
  enable_disk_uuid = true
  orgname          = "bsorenson.io"
  workgroup        = "bsorenson"
  is_windows_image = true
  firmware         = "efi"
  local_adminpass  = "pen15c1uB"
}

module "wtw-onprem-linux" {
  source            = "Terraform-VMWare-Modules/vm/vsphere"
  version           = "3.4.0"
  count             = var.env[local.environment].instances
  vmname            = format("${var.env[local.environment].app_prefix}${var.namefmt}-${var.application_name}", count.index + 1)
  dc                = var.env[local.environment].dc
  vmrp              = var.env[local.environment].vmrp #Works with ESXi/Resources
  vmfolder          = var.env[local.environment].vmfolder #Works with ESXi/Resources
  datastore         = var.env[local.environment].ds_cluster #You can use datastore variable instead
  vmtemp            = "RandomWindowsTemplate"
  instances         = var.env[local.environment].instances
  domain            = "bsorenson.io"
  network = {
    "Server Network" = var.ipv4_address # To use DHCP create Empty list ["",""]
  }
  dns_server_list  = var.env[local.environment].dns_server_list
  vmgateway        = var.ipv4_gateway
  network_type    = ["vmxnet3"]
}