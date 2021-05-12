
variable "common" {
  type = map(string)
  default = {
    os_type       = "ubuntu"
    clone         = "ubuntu-20.04-cloudimg"
    search_domain = "56k.jp"
    nameserver    = "10.75.1.1"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    dfw-k8s-master1 = {
      id      = 4010
      cidr    = "10.75.40.10/24"
      cores   = 4
      gw      = "10.75.40.1"
      macaddr = "02:DE:4D:48:28:01"
      ip      = "10.75.40.11"
      memory  = 4096
      disk    = "40G"
      target_node = "dfw-srv-pve1"
    },
    dfw-k8s-master2 = {
      id      = 4011
      cidr    = "10.75.40.11/24"
      cores   = 4
      gw      = "10.75.40.1"
      macaddr = "02:DE:4D:48:28:02"
      ip      = "10.75.40.12"
      memory  = 4096
      disk    = "40G"
      target_node = "dfw-srv-pve2"
    },
    dfw-k8s-master3 = {
      id      = 4012
      cidr    = "10.75.40.12/24"
      cores   = 4
      gw      = "10.75.40.1"
      macaddr = "02:DE:4D:48:28:03"
      ip      = "10.75.40.13"
      memory  = 4096
      disk    = "40G"
      target_node = "dfw-srv-pve3"
    }
  }
}

variable "workers" {
  type = map(map(string))
  default = {
    dfw-k8s-worker1 = {
      id      = 4020
      cidr    = "10.75.40.20/24"
      cores   = 2
      gw      = "10.75.40.1"
      macaddr = "02:DE:4D:48:28:0A"
      ip      = "10.75.40.20"
      memory  = 6144
      disk    = "40G"
      target_node = "dfw-srv-pve1"
    },
    dfw-k8s-worker2 = {
      id      = 4021
      cidr    = "10.75.40.21/24"
      cores   = 2
      gw      = "10.75.40.1"
      macaddr = "02:DE:4D:48:28:0B"
      ip      = "10.75.40.21"
      memory  = 6144
      disk    = "40G"
      target_node = "dfw-srv-pve2"
    },
    dfw-k8s-worker3= {
      id      = 4022
      cidr    = "10.75.40.22/24"
      cores   = 2
      gw      = "10.75.40.1"
      macaddr = "02:DE:4D:48:28:0C"
      ip      = "10.75.40.22"
      memory  = 6144
      disk    = "40G"
      target_node = "dfw-srv-pve3"
    },
    dfw-k8s-worker4= {
      id      = 4023
      cidr    = "10.75.40.23/24"
      cores   = 2
      gw      = "10.75.40.1"
      macaddr = "02:DE:4D:48:28:0D"
      ip      = "10.75.40.23"
      memory  = 6144
      disk    = "40G"
      target_node = "dfw-srv-pve4"
    },
  }
}