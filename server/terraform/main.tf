terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.8.0"
    }

    sops = {
      source = "carlpett/sops"
      version = "0.6.3"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://10.75.30.20:8006/api2/json"
    pm_user = "root@pam"
    pm_parallel = 4
}

provider "sops" {}
