
variable "common" {
  type = map(string)
  default = {
    os_type       = "ubuntu"
    clone         = "ubuntu-20.04-cloudimg"
    search_domain = "dfw.56k.sh 56k.sh"
    nameserver    = "10.75.0.1"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    k8s-master01 = {
      id          = 4010
      cidr        = "10.75.40.10/24"
      ceph_cidr   = "10.75.33.40/24"
      cores       = 8
      gw          = "10.75.40.1"
      macaddr     = "02:DE:4D:48:28:01"
      memory      = 8192
      disk        = "40G"
      target_node = "pve01"
    },
    k8s-master02 = {
      id          = 4011
      cidr        = "10.75.40.11/24"
      ceph_cidr   = "10.75.33.41/24"
      cores       = 8
      gw          = "10.75.40.1"
      macaddr     = "02:DE:4D:48:28:02"
      memory      = 8192
      disk        = "40G"
      target_node = "pve02"
    },
    k8s-master03 = {
      id          = 4012
      cidr        = "10.75.40.12/24"
      ceph_cidr   = "10.75.33.42/24"
      cores       = 8
      gw          = "10.75.40.1"
      macaddr     = "02:DE:4D:48:28:03"
      memory      = 8192
      disk        = "40G"
      target_node = "pve03"
    }
  }
}

variable "workers" {
  type = map(map(string))
  default = {
    k8s-worker01 = {
      id          = 4020
      cidr        = "10.75.40.20/24"
      ceph_cidr   = "10.75.33.50/24"
      cores       = 16
      gw          = "10.75.40.1"
      macaddr     = "02:DE:4D:48:28:0A"
      memory      = 16384
      disk        = "40G"
      target_node = "pve01"
    },
    k8s-worker02 = {
      id          = 4021
      cidr        = "10.75.40.21/24"
      ceph_cidr   = "10.75.33.51/24"
      cores       = 16
      gw          = "10.75.40.1"
      macaddr     = "02:DE:4D:48:28:0B"
      memory      = 16384
      disk        = "40G"
      target_node = "pve02"
    },
    k8s-worker03 = {
      id          = 4022
      cidr        = "10.75.40.22/24"
      ceph_cidr   = "10.75.33.52/24"
      cores       = 16
      gw          = "10.75.40.1"
      macaddr     = "02:DE:4D:48:28:0C"
      memory      = 16384
      disk        = "40G"
      target_node = "pve03"
    },
    k8s-worker04 = {
      id          = 4023
      cidr        = "10.75.40.23/24"
      ceph_cidr   = "10.75.33.53/24"
      cores       = 16
      gw          = "10.75.40.1"
      macaddr     = "02:DE:4D:48:28:0D"
      memory      = 16384
      disk        = "40G"
      target_node = "pve04"
    },
  }
}
