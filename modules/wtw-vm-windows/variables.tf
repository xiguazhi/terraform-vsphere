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
    dns_server_list        = list(string)
    instances              = number
    cpu_number             = number
    num_cores_per_socket   = number
    memory_hot_add_enabled = bool
    ram_size               = number
    ipv4submask            = list(string)
    vmgateway              = string
    dns_server_list        = list(string)
    alias                  = string
  }))
  default = {
    dev = {
      vcenter_server         = "vcenter.bsorenson.io"
      dc                     = "TEXAS",
      app_prefix             = "txd",
      vmrp                   = "Richardson",
      vmfolder               = "Dev/Application",
      ds_cluster             = "wdBlue",
      dns_server_list        = ["10.0.30.63"],
      instances              = 1,
      cpu_number             = 1,
      num_cores_per_socket   = 4,
      ram_size               = 8192,
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"]
      alias                  = "TEXAS"
    }
    QA = {
      vcenter_server         = "vcenter.bsorenson.io"
      dc                     = "TEXAS",
      app_prefix             = "txq",
      vmrp                   = "Richardson",
      vmfolder               = "QA/Application",
      ds_cluster             = "wdBlue",
      dns_server_list        = ["10.0.30.63"],
      instances              = 2,
      cpu_number             = 1,
      num_cores_per_socket   = 4,
      ram_size               = 8192
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"]
      alias                  = "TEXAS"

    },
    stage = {
      vcenter_server         = "vcenter.bsorenson.io"
      dc                     = "UTAH",
      app_prefix             = "wjs",
      vmrp                   = "WestJordan",
      vmfolder               = "Stage/Application",
      ds_cluster             = "wdBlue",
      dns_server_list        = ["10.0.30.63"],
      instances              = 3,
      cpu_number             = 1,
      num_cores_per_socket   = 4,
      ram_size               = 8192
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"]
      alias                  = "UTAH"

    }
    prod = {
      vcenter_server         = "vcenter.bsorenson.io"
      dc                     = "UTAH",
      app_prefix             = "wjp",
      vmrp                   = "WestJordan",
      vmfolder               = "prod/Application",
      ds_cluster             = "wdBlue",
      dns_server_list        = ["10.0.30.63"],
      instances              = 4,
      cpu_number             = 1,
      num_cores_per_socket   = 4,
      ram_size               = 8192,
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"]
      alias                  = "UTAH"

    }
    manual = {
      vcenter_server         = "vcenter.bsorenson.io"
      dc                     = "UTAH",
      app_prefix             = "wjp",
      vmrp                   = "WestJordan",
      vmfolder               = "prod/Application",
      ds_cluster             = "wdBlue",
      dns_server_list        = ["10.0.30.63"],
      instances              = 4,
      cpu_number             = 1,
      num_cores_per_socket   = 4,
      ram_size               = 8192,
      memory_hot_add_enabled = true,
      ipv4submask            = ["24"],
      vmgateway              = "10.0.30.1",
      dns_server_list        = ["10.0.30.63"]
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

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}