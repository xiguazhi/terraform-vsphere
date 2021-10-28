variable "DATACENTER" {
    type = map(object({
        alias = string
        vcenter_server = string

    }))
    default = {
        "TEXAS" = {
        alias = "TEXAS",
        vcenter_server = "bsorenson.vcenter.io"
        },
        "UTAH" = {
        alias = "UTAH",
        vcenter_server = "bsorenson.vcenter.io"
        }
    }
}



variable "env" {
    type = map(object({
        dc = string
        app_prefix = string
        vmrp = string
        vmfolder = string
        ds_cluster = string
        dns_server_list = list(string)
        instances = number
        cpu_number = number
        num_cores_per_socket = number
        memory_hot_add_enabled = bool
        ram_size = number
        ipv4mask = list(string)
        vmgateway = string
        dns_server_list = list(string)
    }))
    default = {
        dev = {
            dc = "TEXAS",
            app_prefix = "txd",
            vmrp = "Richardson",
            vmfolder = "Dev/Application",
            ds_cluster = "wdBlue",
            dns_server_list = ["10.0.30.63"],
            instances = 2,
            cpu_number = 1,
            num_cores_per_socket = 4,
            ram_size = 8192,
            memory_hot_add_enabled = true,
            ipv4submask = ["24"],
            vmgateway = "10.0.30.1",
            dns_server_list = ["10.0.30.63"]
        }
        QA  = {
            dc = "TEXAS",
            app_prefix = "txq",
            vmrp = "Richardson",
            vmfolder = "QA/Application",
            ds_cluster = "wdBlue",
            dns_server_list = ["10.0.30.63"],
            instances = 2,
            cpu_number = 1,
            num_cores_per_socket = 4,
            ram_size = 8192
            memory_hot_add_enabled = true,
            ipv4submask = ["24"],
            vmgateway = "10.0.30.1",
            dns_server_list = ["10.0.30.63"]

        },
       stage = {
            dc = "UTAH",
            app_prefix = "wjs",
            vmrp = "WestJordan",
            vmfolder = "Stage/Application",
            ds_cluster = "wdBlue",
            dns_server_list = ["10.0.30.63"],
            instances = 3,
            cpu_number = 1,
            num_cores_per_socket = 4,
            ram_size = 8192
            memory_hot_add_enabled = true,
            ipv4submask = ["24"],
            vmgateway = "10.0.30.1",
            dns_server_list = ["10.0.30.63"]

        }
        prod = {
            dc = "UTAH",
            app_prefix = "wjp",
            vmrp = "WestJordan",
            vmfolder = "prod/Application",
            ds_cluster = "wdBlue",
            dns_server_list = ["10.0.30.63"],
            instances = 4,
            cpu_number = 1,
            num_cores_per_socket = 4,
            ram_size = 8192,
            memory_hot_add_enabled = true,
            ipv4submask = ["24"],
            vmgateway = "10.0.30.1",
            dns_server_list = ["10.0.30.63"]

        }
       manual = {
            dc = "UTAH",
            app_prefix = "wjp",
            vmrp = "WestJordan",
            vmfolder = "prod/Application",
            ds_cluster = "wdBlue",
            dns_server_list = ["10.0.30.63"],
            instances = 4,
            cpu_number = 1,
            num_cores_per_socket = 4,
            ram_size = 8192,
            memory_hot_add_enabled = true,
            ipv4submask = ["24"],
            vmgateway = "10.0.30.1",
            dns_server_list = ["10.0.30.63"]

        }
    }

}

variable "application_name" {
    type = string
    default = "actions"
}

variable "ipv4_gateway" {
    type = string
    default = "10.0.30.1"
}

variable ipv4_address {
    type = list
    default = [""]
}

variable "namefmt" {
    type = string
    default = "%0d"
}


variable "template" {
    type = string
}

variable "cpu_number" {
    type = number
    default = 1
}

variable "num_cores_per_socket" {

}

variable "domain" {
    type = string
    default = "bsorenson.io"
}

variable "instances" {
    type = number
}
  

variable "environment" {
    type = object()
}