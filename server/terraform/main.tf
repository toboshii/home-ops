terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.7.0"
    }

    sops = {
      source = "carlpett/sops"
      version = "0.6.2"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://10.75.30.20:8006/api2/json"
    pm_user = "root@pam"
}

provider "sops" {}