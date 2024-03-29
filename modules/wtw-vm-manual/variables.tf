variable "DATACENTER" {
  type = map(object({
    alias          = string
    vcenter_server = string

  }))
  default = {
    "TEXAS" = {
      alias          = "TEXAS",
      vcenter_server = "bsorenson.vcenter.io"
    },
    "UTAH" = {
      alias          = "UTAH",
      vcenter_server = "bsorenson.vcenter.io"
    }
  }
}



variable "env" {
  type = map(object({
    vcenter_server         = string
    dc                     = string
    app_prefix             = string
    vmrp                   = string
    vmfolder               = string
    ds_cluster             = string
    instances              = number
    cpu_number             = number
    num_cores_per_socket   = number
    memory_hot_add_enabled = bool
    ram_size               = number
    ipv4submask            = list(string)
    ipv4network            = string
    vmgateway              = string
    dns_server_list        = list(string)
    alias                  = string
  }))
  default = {
    dev = {
      vcenter_server         = "10.0.4.41"
      dc                     = "bsorenson.io",
      app_prefix             = "bsd",
      vmrp                   = "prod",
      vmfolder               = "Pipeline",
      ds_cluster             = "wdBlue",
      instances              = 1,
      cpu_number             = 1,
      num_cores_per_socket   = 2,
      ram_size               = 2048,
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      ipv4network            = "Server VLAN"
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"],
      alias                  = "TEXAS"
    }
    QA = {
      vcenter_server         = "10.0.4.41"
      dc                     = "TEXAS",
      app_prefix             = "txq",
      vmrp                   = "Richardson",
      vmfolder               = "QA/Application",
      ds_cluster             = "wdBlue",
      instances              = 2,
      cpu_number             = 1,
      num_cores_per_socket   = 2,
      ram_size               = 4096,
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      ipv4network            = "Server VLAN",
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"],
      alias                  = "TEXAS"

    },
    stage = {
      vcenter_server         = "vcenter.bsorenson.io"
      dc                     = "UTAH",
      app_prefix             = "wjs",
      vmrp                   = "WestJordan",
      vmfolder               = "Stage/Application",
      ds_cluster             = "wdBlue",
      instances              = 3,
      cpu_number             = 1,
      num_cores_per_socket   = 2,
      ram_size               = 4096
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      ipv4network            = "Server VLAN",
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"],
      alias                  = "UTAH"

    }
    prod = {
      vcenter_server         = "vcenter.bsorenson.io"
      dc                     = "UTAH",
      app_prefix             = "wjp",
      vmrp                   = "WestJordan",
      vmfolder               = "prod/Application",
      ds_cluster             = "wdBlue",
      instances              = 4,
      cpu_number             = 1,
      num_cores_per_socket   = 4,
      ram_size               = 4096,
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      ipv4network            = "Server VLAN",
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"],
      alias                  = "UTAH"

    }
    manual = {
      vcenter_server         = "vcenter.bsorenson.io"
      dc                     = "UTAH",
      app_prefix             = "wjp",
      vmrp                   = "WestJordan",
      vmfolder               = "prod/Application",
      ds_cluster             = "wdBlue",
      instances              = 1,
      cpu_number             = 1,
      num_cores_per_socket   = 1,
      ram_size               = 1024,
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      ipv4network            = "Server VLAN",
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"],
      alias                  = "UTAH"
    }
  }

}

variable "application_name" {
  type    = string
  default = "actions"
}

variable "ipv4_gateway" {
  type    = string
  default = "10.0.30.1"
}

variable "ipv4_address" {
  type    = list(any)
  default = [""]
}


variable "namefmt" {
  type    = string
  default = "%0d"
}


variable "domain" {
  type    = string
  default = "bsorenson.io"
}


variable "environment" {
  type        = string
  description = "Environment type."

  validation {
    condition     = contains(["dev", "QA", "stage", "prod"], var.environment)
    error_message = "Valid values for var: environment are (dev, QA, stage, prod)."
  }
}

variable "vmtemp" {
  type        = string
  description = "VM Template."
}

variable "vsphere_user" {}

variable "vsphere_password" {}

variable "dns_server_list" {
  type    = list(string)
  default = ["1.1.1.1", "1.0.0.1"]
}