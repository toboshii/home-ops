<img src="https://camo.githubusercontent.com/5b298bf6b0596795602bd771c5bddbb963e83e0f/68747470733a2f2f692e696d6775722e636f6d2f7031527a586a512e706e67" align="left" width="144px" height="144px"/>

# My home operations repository 🎛🔨
_... managed by Flux Renovate, and GitHub Actions_ 🤖

<br />

<div align="center">

[![Discord](https://img.shields.io/discord/673534664354430999?style=for-the-badge&label=discord&logo=discord&logoColor=white)](https://discord.gg/k8s-at-home)
[![talos](https://img.shields.io/badge/talos-v1.1.2-brightgreen?style=for-the-badge&logo=linux&logoColor=white)](https://www.talos.dev/)
[![kubernetes](https://img.shields.io/badge/kubernetes-v1.24.3-brightgreen?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge)](https://github.com/pre-commit/pre-commit)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/toboshii/home-ops/Schedule%20-%20Renovate?label=renovate&logo=renovatebot&style=for-the-badge)](https://github.com/toboshii/home-ops/actions/workflows/schedule-renovate.yaml)
[![Lines of code](https://img.shields.io/tokei/lines/github/toboshii/home-ops?style=for-the-badge&color=brightgreen&label=lines&logo=codefactor&logoColor=white)](https://github.com/toboshii/home-ops/graphs/contributors)

</div>

---

## 📖 Overview

This is a mono repository for my home infrastructure and Kubernetes cluster implementing Infrastructure as Code (IaC) and GitOps practices using tools like [Kubernetes](https://kubernetes.io/), [Flux](https://github.com/fluxcd/flux2), [Renovate](https://github.com/renovatebot/renovate) and [GitHub Actions](https://github.com/features/actions).

Feel free to open a [Github issue](https://github.com/toboshii/home-ops/issues/new/choose) or join the [k8s@home Discord](https://discord.gg/sTMX7Vh) if you have any questions.

---

## ⛵ Kubernetes

This repo generally attempts to follow the structure and practices of the excellent [k8s-at-home/template-cluster-k3](https://github.com/k8s-at-home/template-cluster-k3s), check it out if you're uncomfortable starting out with an immutable operating system.

### Installation

The cluster is running on [Talos Linux](https://talos.dev/), an immutable and ephemeral Linux distribution built around Kubernetes, deployed on bare-metal. [Rook Ceph](https://rook.io/) running hyper-converged with workloads provides persistent block and object storage, while a seperate server provides bulk (NFS) file storage.

### Core components

- [cilium/cilium](https://github.com/cilium/cilium): Internal Kubernetes networking plugin.
- [rook/rook](https://github.com/rook/rook): Distributed block storage for peristent storage.
- [mozilla/sops](https://toolkit.fluxcd.io/guides/mozilla-sops/): Manages secrets for Kubernetes, Ansible and Terraform.
- [kubernetes-sigs/external-dns](https://github.com/kubernetes-sigs/external-dns): Automatically manages DNS records from my cluster in a cloud DNS provider.
- [jetstack/cert-manager](https://cert-manager.io/docs/): Creates SSL certificates for services in my Kubernetes cluster.
- [kubernetes/ingress-nginx](https://github.com/kubernetes/ingress-nginx/): Ingress controller to expose HTTP traffic to pods over DNS.

### GitOps

[Flux](https://github.com/fluxcd/flux2) watches my [cluster](./cluster/) folder (see Directories below) and makes the changes to my cluster based on the YAML manifests.

[Renovate](https://github.com/renovatebot/renovate) watches my **entire** repository looking for dependency updates, when they are found a PR is automatically created. When PRs are merged, [Flux](https://github.com/fluxcd/flux2) applies the changes to my cluster.

### Directories

This Git repository contains the following directories (_kustomizatons_) under [cluster](./cluster/).

```sh
📁 cluster      # k8s cluster defined as code
├─📁 bootstrap  # contains the initial kustomization used to install flux
├─📁 flux       # flux, gitops operator, loaded before everything
├─📁 crds       # custom resources, loaded before 📁 core and 📁 apps
├─📁 charts     # helm repos, loaded before 📁 core and 📁 apps
├─📁 config     # cluster config, loaded before 📁 core and 📁 apps
├─📁 core       # crucial apps, namespaced dir tree, loaded before 📁 apps
└─📁 apps       # regular apps, namespaced dir tree, loaded last
```

### Networking

| Name                                         | CIDR            |
|----------------------------------------------|-----------------|
| Kubernetes Nodes                             | `10.75.40.0/24` |
| Kubernetes external services (Cilium w/ BGP) | `10.75.45.0/24` |
| Kubernetes pods                              | `172.22.0.0/16` |
| Kubernetes services                          | `172.24.0.0/16` |

## 🌐 DNS

### Ingress Controller

Over WAN, I have port forwarded ports `80` and `443` to the load balancer IP of my ingress controller that's running in my Kubernetes cluster.

[Cloudflare](https://www.cloudflare.com/) works as a proxy to hide my homes WAN IP and also as a firewall. When not on my home network, all the traffic coming into my ingress controller on port `80` and `443` comes from Cloudflare. In `VyOS` I block all IPs not originating from [Cloudflares list of IP ranges](https://www.cloudflare.com/ips/).

🔸 _Cloudflare is also configured to GeoIP block all countries except a few I have whitelisted_

### Internal DNS

[k8s_gateway](https://github.com/ori-edge/k8s_gateway) is deployed on my router running [VyOS](https://vyos.io/). With this setup, `k8s_gateway` has direct access to my clusters ingress records and serves DNS for them in my internal network.

Without much engineering of DNS @home, these options have made my `VyOS` router a single point of failure for DNS. I believe this is ok though because my router _should_ have the most uptime of all my systems.

### External DNS

[external-dns](https://github.com/kubernetes-sigs/external-dns) is deployed in my cluster and configured to sync DNS records to [Cloudflare](https://www.cloudflare.com/). The only ingresses `external-dns` looks at to gather DNS records to put in `Cloudflare` are ones where I explicitly set an annotation of `external-dns.home.arpa/enabled: "true"`

---

## 🔧 Hardware

| Device                    | Count | OS Disk Size | Data Disk Size             | Ram   | Operating System | Purpose                        |
|---------------------------|-------|--------------|----------------------------|-------|------------------|--------------------------------|
| Dell R220                 | 1     | 120GB SSD    | N/A                        | 16GB  | VyOS 1.4         | Router                         |
| HP S01-pf1000             | 3     | 120GB SSD    | N/A                        | 8GB   | Talos Linux      | Kubernetes Control Nodes       |
| HP S01-pf1000             | 3     | 120GB SSD    | 1TB NVMe (rook-ceph)       | 32GB  | Talos Linux      | Kubernetes Workers             |
| SuperMicro SC836          | 1     | 120GB SSD    | 16x8TB + 16x3TB ZFS RAIDZ2 | 192GB | Ubuntu 20.04     | NFS                            |
| Brocade ICX 6610          | 1     | N/A          | N/A                        | N/A   | N/A              | Core Switch                    |
| Raspberry Pi 4B           | 1     | 32GB SD Card | N/A                        | 4GB   | PiKVM            | Network KVM                    |
| TESmart 8 Port KVM Switch | 1     | N/A          | N/A                        | N/A   | N/A              | Network KVM switch for PiKVM   |
| APC SUA3000RMXL3U w/ NIC  | 1     | N/A          | N/A                        | N/A   | N/A              | UPS                            |
| APC AP7930                | 1     | N/A          | N/A                        | N/A   | N/A              | PDU                            |

---

## 🤝 Thanks

Thanks to all folks who donate their time to the [Kubernetes @Home](https://github.com/k8s-at-home/) community. A lot of inspiration for my cluster came from those that have shared their clusters over at [awesome-home-kubernetes](https://github.com/k8s-at-home/awesome-home-kubernetes).

---

## 📜 Changelog

See [commit history](https://github.com/onedr0p/home-ops/commits/main)

---

## 🔏 License

See [LICENSE](./LICENSE)
