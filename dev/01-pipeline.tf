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
  application_name = "pipeline"
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  disk_size_gb     = ["300"]  
}
