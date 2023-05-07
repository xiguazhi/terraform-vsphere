provider "vsphere" {
  vcenter_server = var.env[var.environment].vsphere_server
  user           = var.vsphere_user     # vcenter server and credentials are for local @ home development and need to be changed to work in a different environment.  
  password       = var.vsphere_password # Nothing will be hardcoded and checked into the repo but in development sops with locall stored key is used for credentials.\


  # if you have a self-signed cert
  allow_unverified_ssl = true

}

module "wtw-onprem-windows" {
  source                 = "Terraform-VMWare-Modules/vm/vsphere"
  count                  = var.env[local.environment].instances
  vmname                 = format("${var.env[local.environment].app_prefix}${var.namefmt}-${var.application_name}", count.index + 1)
  version                = "3.4.0"
  dc                     = var.env[var.environment].dc
  vmrp                   = var.env[var.environment].vmrp       #Works with ESXi/Resources
  vmfolder               = var.env[var.environment].vmfolder   #Works with ESXi/Resources
  datastore_cluster      = var.env[var.environment].ds_cluster #You can use datastore variable instead
  vmtemp                 = "RandomWindowsTemplate"
  instances              = var.env[var.environment].instances
  cpu_number             = var.env[var.environment].cpu_number
  num_cores_per_socket   = var.env[var.environment].num_cores_per_socket
  memory_hot_add_enabled = var.env[var.environment].memory_hot_add_enabled
  ram_size               = var.env[var.environment].ram_size

  domain = "bsorenson.io" #MAKE SURE YOU UPDATE VARIABLES TO ALIGN WITH ***YOUR*** ENVIRONMENT
  network = {
    "Server Network" = var.ipv4_address # To use DHCP create Empty list ["",""]
  }
  scsi_bus_sharing = "physicalSharing" // The modes are physicalSharing, virtualSharing, and noSharing
  scsi_type        = "pvscsi"          // Other acceptable value "pvscsi"
  scsi_controller  = 0                 // This will assign OS disk to controller 0
  dns_server_list  = var.env[var.environment].dns_server_list
  vmgateway        = var.ipv4_gateway
  enable_disk_uuid = true
  orgname          = "bsorenson.io"
  workgroup        = "bsorenson"
  is_windows_image = true
  firmware         = "efi"
  local_adminpass  = "pen15c1uB"
}
