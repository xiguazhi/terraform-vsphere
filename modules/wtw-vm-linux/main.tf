provider "vsphere" {
  vsphere_server = var.env[var.environment].vcenter_server

  user     = var.vsphere_user
  password = var.vsphere_password # Nothing will be hardcoded and checked into the repo but in development sops with locall stored key is used for credentials.\


  # if you have a self-signed cert
  allow_unverified_ssl = true

}

module "wtw-onprem-linux" {
  source                 = "Terraform-VMWare-Modules/vm/vsphere"
  version                = "3.5.0"
  vmname                 = format("%s-%s", var.env[var.environment].app_prefix, var.application_name)
  dc                     = var.env[var.environment].dc
  vmrp                   = var.env[var.environment].vmrp       #Works with ESXi/Resources
  vmfolder               = var.env[var.environment].vmfolder   #Works with ESXi/Resources
  datastore              = var.env[var.environment].ds_cluster #You can use datastore variable instead
  vmtemp                 = var.vmtemp
  instances              = var.node_count != 0 ? var.node_count : var.env[var.environment].instances
  cpu_number             = var.env[var.environment].cpu_number
  num_cores_per_socket   = var.env[var.environment].num_cores_per_socket
  memory_hot_add_enabled = var.env[var.environment].memory_hot_add_enabled
  ram_size               = var.env[var.environment].ram_size
  disk_size_gb           = var.disk_size_gb
  domain                 = "bsorenson.io"
  network                = {
    "Server VLAN" = var.ipv4_address # To use DHCP create Empty list ["",""]
  }
  dns_server_list        = var.env[var.environment].dns_server_list
  vmgateway              = var.ipv4_gateway
  network_type           = var.network_type
  ipv4submask            = var.ipv4submask
}