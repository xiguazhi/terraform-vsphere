data "terraform_remote_state" "foo" {
  backend = "local"

  config = {
    path = "/home/administrator/terraform/terraform.tfstate"
  }
}

module "pipeline" {
  environment      = "dev"
  source           = "../modules/wtw-vm-linux/"
  vmtemp           = "Ubuntu2004"
  cpu_share_count  = 1000
  memory           = 8192
  memory_share_count = 81920
  num_cores_per_socket = 4
  num_cpus         = 1
  application_name = "pipeline"
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  disk_size_gb     = ["300"]  
}
