module "minecraft" {
  environment      = "dev"
  source           = "../modules/wtw-vm-linux/"
  vmtemp           = "Ubuntu2004"
  application_name = "minecraft"
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  disk_size_gb     = ["75"]

}
