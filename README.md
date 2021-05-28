<img src="https://camo.githubusercontent.com/5b298bf6b0596795602bd771c5bddbb963e83e0f/68747470733a2f2f692e696d6775722e636f6d2f7031527a586a512e706e67" align="left" width="144px" height="144px"/>

# My home Kubernetes cluster :sailboat:
_... managed by Flux and serviced with RenovateBot_ :robot:

[![Discord](https://img.shields.io/discord/673534664354430999?color=7289da&label=DISCORD&style=for-the-badge)](https://discord.gg/sTMX7Vh)
[![k3s](https://img.shields.io/badge/k3s-v1.20.6-orange?style=for-the-badge)](https://k3s.io/)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge)](https://github.com/pre-commit/pre-commit)
[![renovate](https://img.shields.io/badge/renovate-enabled-green?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjUgNSAzNzAgMzcwIj48Y2lyY2xlIGN4PSIxODkiIGN5PSIxOTAiIHI9IjE4NCIgZmlsbD0iI2ZlMiIvPjxwYXRoIGZpbGw9IiM4YmIiIGQ9Ik0yNTEgMjU2bC0zOC0zOGExNyAxNyAwIDAxMC0yNGw1Ni01NmMyLTIgMi02IDAtN2wtMjAtMjFhNSA1IDAgMDAtNyAwbC0xMyAxMi05LTggMTMtMTNhMTcgMTcgMCAwMTI0IDBsMjEgMjFjNyA3IDcgMTcgMCAyNGwtNTYgNTdhNSA1IDAgMDAwIDdsMzggMzh6Ii8+PHBhdGggZmlsbD0iI2Q1MSIgZD0iTTMwMCAyODhsLTggOGMtNCA0LTExIDQtMTYgMGwtNDYtNDZjLTUtNS01LTEyIDAtMTZsOC04YzQtNCAxMS00IDE1IDBsNDcgNDdjNCA0IDQgMTEgMCAxNXoiLz48cGF0aCBmaWxsPSIjYjMwIiBkPSJNMjg1IDI1OGw3IDdjNCA0IDQgMTEgMCAxNWwtOCA4Yy00IDQtMTEgNC0xNiAwbC02LTdjNCA1IDExIDUgMTUgMGw4LTdjNC01IDQtMTIgMC0xNnoiLz48cGF0aCBmaWxsPSIjYTMwIiBkPSJNMjkxIDI2NGw4IDhjNCA0IDQgMTEgMCAxNmwtOCA3Yy00IDUtMTEgNS0xNSAwbC05LThjNSA1IDEyIDUgMTYgMGw4LThjNC00IDQtMTEgMC0xNXoiLz48cGF0aCBmaWxsPSIjZTYyIiBkPSJNMjYwIDIzM2wtNC00Yy02LTYtMTctNi0yMyAwLTcgNy03IDE3IDAgMjRsNCA0Yy00LTUtNC0xMSAwLTE2bDgtOGM0LTQgMTEtNCAxNSAweiIvPjxwYXRoIGZpbGw9IiNiNDAiIGQ9Ik0yODQgMzA0Yy00IDAtOC0xLTExLTRsLTQ3LTQ3Yy02LTYtNi0xNiAwLTIybDgtOGM2LTYgMTYtNiAyMiAwbDQ3IDQ2YzYgNyA2IDE3IDAgMjNsLTggOGMtMyAzLTcgNC0xMSA0em0tMzktNzZjLTEgMC0zIDAtNCAybC04IDdjLTIgMy0yIDcgMCA5bDQ3IDQ3YTYgNiAwIDAwOSAwbDctOGMzLTIgMy02IDAtOWwtNDYtNDZjLTItMi0zLTItNS0yeiIvPjxwYXRoIGZpbGw9IiMxY2MiIGQ9Ik0xNTIgMTEzbDE4LTE4IDE4IDE4LTE4IDE4em0xLTM1bDE4LTE4IDE4IDE4LTE4IDE4em0tOTAgODlsMTgtMTggMTggMTgtMTggMTh6bTM1LTM2bDE4LTE4IDE4IDE4LTE4IDE4eiIvPjxwYXRoIGZpbGw9IiMxZGQiIGQ9Ik0xMzQgMTMxbDE4LTE4IDE4IDE4LTE4IDE4em0tMzUgMzZsMTgtMTggMTggMTgtMTggMTh6Ii8+PHBhdGggZmlsbD0iIzJiYiIgZD0iTTExNiAxNDlsMTgtMTggMTggMTgtMTggMTh6bTU0LTU0bDE4LTE4IDE4IDE4LTE4IDE4em0tODkgOTBsMTgtMTggMTggMTgtMTggMTh6bTEzOS04NWwyMyAyM2M0IDQgNCAxMSAwIDE2TDE0MiAyNDBjLTQgNC0xMSA0LTE1IDBsLTI0LTI0Yy00LTQtNC0xMSAwLTE1bDEwMS0xMDFjNS01IDEyLTUgMTYgMHoiLz48cGF0aCBmaWxsPSIjM2VlIiBkPSJNMTM0IDk1bDE4LTE4IDE4IDE4LTE4IDE4em0tNTQgMThsMTgtMTcgMTggMTctMTggMTh6bTU1LTUzbDE4LTE4IDE4IDE4LTE4IDE4em05MyA0OGwtOC04Yy00LTUtMTEtNS0xNiAwTDEwMyAyMDFjLTQgNC00IDExIDAgMTVsOCA4Yy00LTQtNC0xMSAwLTE1bDEwMS0xMDFjNS00IDEyLTQgMTYgMHoiLz48cGF0aCBmaWxsPSIjOWVlIiBkPSJNMjcgMTMxbDE4LTE4IDE4IDE4LTE4IDE4em01NC01M2wxOC0xOCAxOCAxOC0xOCAxOHoiLz48cGF0aCBmaWxsPSIjMGFhIiBkPSJNMjMwIDExMGwxMyAxM2M0IDQgNCAxMSAwIDE2TDE0MiAyNDBjLTQgNC0xMSA0LTE1IDBsLTEzLTEzYzQgNCAxMSA0IDE1IDBsMTAxLTEwMWM1LTUgNS0xMSAwLTE2eiIvPjxwYXRoIGZpbGw9IiMxYWIiIGQ9Ik0xMzQgMjQ4Yy00IDAtOC0yLTExLTVsLTIzLTIzYTE2IDE2IDAgMDEwLTIzTDIwMSA5NmExNiAxNiAwIDAxMjIgMGwyNCAyNGM2IDYgNiAxNiAwIDIyTDE0NiAyNDNjLTMgMy03IDUtMTIgNXptNzgtMTQ3bC00IDItMTAxIDEwMWE2IDYgMCAwMDAgOWwyMyAyM2E2IDYgMCAwMDkgMGwxMDEtMTAxYTYgNiAwIDAwMC05bC0yNC0yMy00LTJ6Ii8+PC9zdmc+)](https://github.com/renovatebot/renovate)


---

## :book:&nbsp; Overview

This repository _is_ my home Kubernetes cluster in a declarative state. [Flux](https://github.com/fluxcd/flux2) watches my [cluster](./cluster/) folder and makes the changes to my cluster based on the YAML manifests.

Feel free to open a [Github issue](https://github.com/toboshii/home-cluster/issues/new/choose) or join the [k8s@home Discord](https://discord.gg/sTMX7Vh) if you have any questions.

This repository is built off the [k8s-at-home/template-cluster-k3s](https://github.com/k8s-at-home/template-cluster-k3s) repository.

---

## :sparkles:&nbsp; Cluster setup

This cluster consists of VMs provisioned on [PVE](https://www.proxmox.com/en/proxmox-ve) via the [Terraform Proxmox provider](https://github.com/Telmate/terraform-provider-proxmox). These run [k3s](https://k3s.io/) provisioned overtop Ubuntu 20.10 using the [Ansible](https://www.ansible.com/) galaxy role [ansible-role-k3s](https://github.com/PyratLabs/ansible-role-k3s). This cluster is not hyper-converged as block storage is provided by the underlying PVE Ceph cluster using rook-ceph-external.

See my [server/ansible](./server/ansible/) directory for my playbooks and roles, and [server/terraform](./server/terraform) for infrastructure provisioning.

## :art:&nbsp; Cluster components

- [kube-vip](https://kube-vip.io/): Uses BGP to load balance the control-plane API, making it highly availible without requiring external HA proxy solutions.
- [calico](https://docs.projectcalico.org/about/about-calico): For internal cluster networking using BGP.
- [traefik](https://traefik.io/): Provides ingress cluster services.
- [rook-ceph](https://rook.io/): Provides persistent volumes, allowing any application to consume RBD block storage from the underlying PVE cluster.
- [SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/): Encrypts secrets which is safe to store - even to a public repository.
- [external-dns](https://github.com/kubernetes-sigs/external-dns): Creates DNS entries in a separate [coredns](https://github.com/coredns/coredns) deployment which is backed by my clusters [etcd](https://github.com/etcd-io/etcd) deployment.
- [cert-manager](https://cert-manager.io/docs/): Configured to create TLS certs for all ingress services automatically using LetsEncrypt.
- [kasten-k10](https://www.kasten.io): Provides disaster recovery via snapshots and out-of-band backups.

---

## :open_file_folder:&nbsp; Repository structure

The Git repository contains the following directories under `cluster` and are ordered below by how Flux will apply them.

- **base** directory is the entrypoint to Flux
- **crds** directory contains custom resource definitions (CRDs) that need to exist globally in your cluster before anything else exists
- **core** directory (depends on **crds**) are important infrastructure applications (grouped by namespace) that should never be pruned by Flux
- **apps** directory (depends on **core**) is where your common applications (grouped by namespace) could be placed, Flux will prune resources here if they are not tracked by Git anymore

```
./cluster
├── ./apps
├── ./base
├── ./core
└── ./crds
```

---

## :robot:&nbsp; Automate all the things!

- [Github Actions](https://docs.github.com/en/actions) for checking code formatting
- Rancher [System Upgrade Controller](https://github.com/rancher/system-upgrade-controller) to apply updates to k3s
- [Renovate](https://github.com/renovatebot/renovate) with the help of the [k8s-at-home/renovate-helm-releases](https://github.com/k8s-at-home/renovate-helm-releases) Github action keeps my application charts and container images up-to-date

---

## :spider_web:&nbsp; Networking

In my network Calico is configured with BGP on my Brocade ICX 6610. With BGP enabled, I advertise a load balancer using `externalIPs` on my Kubernetes services. This makes it so I do not need `Metallb`. Another benefit to this is that I can directly hit any pods IP directly from any device on my local network. All physical hardware (including local clients) are interconnected with 10gig networking, with a seperate dedicated 10gig network for Ceph traffic.

| Name                        | CIDR            |
| --------------------------- | --------------- |
| Management                  | `10.75.10.0/24` |
| Physical Servers            | `10.75.30.0/24` |
| CoroSync0                   | `10.75.31.0/24` |
| CoroSync1                   | `10.75.32.0/24` |
| Ceph Cluster                | `10.75.33.0/24` |
| Virtual Servers             | `10.75.40.0/24` |
| K8s external services (BGP) | `10.75.45.0/24` |
| K8s pods                    | `172.22.0.0/16` |
| K8s services                | `172.24.0.0/16` |

## :man_shrugging:&nbsp; DNS

_(this section blindly copied from [Devin Buhl](https://github.com/onedr0p/home-cluster) as I could never attempt to explain this in a better way)_

To prefix this, I should mention that I only use one domain name for internal and externally facing applications. Also this is the most complicated thing to explain but I will try to sum it up.

On [pfSense](https://arstechnica.com/gadgets/2021/03/buffer-overruns-license-violations-and-bad-code-freebsd-13s-close-call/) under `Services: DNS Resolver: Domain Overrides` I have a `Domain Override` set to my domain with the address pointing to my _in-cluster-non-cluster service_ CoreDNS load balancer IP. This allows me to use [Split-horizon DNS](https://en.wikipedia.org/wiki/Split-horizon_DNS). [external-dns](https://github.com/kubernetes-sigs/external-dns) reads my clusters `Ingress`'s and inserts DNS records containing the sub-domain and load balancer IP (of traefik) into the _in-cluster-non-cluster service_ CoreDNS service and into Cloudflare depending on if an annotation is present on the ingress. See the diagram below for a visual representation.

<div align="center">
<img src="https://user-images.githubusercontent.com/213795/116820353-91f6e480-ab42-11eb-9109-95e485df9249.png" align="center" />
</div>

---

## :gear:&nbsp; Hardware

| Device           | Count | OS Disk Size | Data Disk Size                     | Ram   | Purpose                                  |
| ---------------- | ----- | ------------ | ---------------------------------- | ----- | ---------------------------------------- |
| Intel R1208GL4DS | 4     | 120GB SSD    | 2x480GB SSD<br/>4x900GB 10.6k SAS  | 64GB  | Proxmox hypervisors<br/>and Ceph cluster |
| Intel R1208GL4DS | 1     | 120GB SSD    | 2x900GB 10.6k SAS                  | 32GB  | Backup cold spare                        |
| NAS (franxx)     | 1     | 120GB SSD    | 16x8TB RAIDZ2<br/>6x4TB ZFS Mirror | 192GB | Media and shared file storage            |

---

## :wrench:&nbsp; Tools

| Tool                                                   | Purpose                                                                   |
| ------------------------------------------------------ | ------------------------------------------------------------------------- |
| [direnv](https://github.com/direnv/direnv)             | Sets `KUBECONFIG` environment variable based on present working directory |
| [go-task](https://github.com/go-task/task)             | Alternative to makefiles, who honestly likes that?                        |
| [pre-commit](https://github.com/pre-commit/pre-commit) | Enforce code consistency and verifies no secrets are pushed               |
| [stern](https://github.com/stern/stern)                | Tail logs in Kubernetes                                                   |

---

## :handshake:&nbsp; Thanks

A lot of inspiration for my cluster came from the people that have shared their clusters over at [awesome-home-kubernetes](https://github.com/k8s-at-home/awesome-home-kubernetes)
