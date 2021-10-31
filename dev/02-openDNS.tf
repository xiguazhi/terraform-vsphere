data "terraform_remote_state" "foo" {
  backend = "local"

  config = {
    path = "/home/administrator/terraform/terraform.tfstate"
  }
}

module "openDNS" {
  environment      = "dev"
  source           = "../modules/wtw-vm-linux/"
  vmtemp           = "Ubuntu2004"
  application_name = "openDNS"
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
    
}
