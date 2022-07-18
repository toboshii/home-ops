#!/bin/bash

# Configure the control-plane nodes
talosctl apply-config -i -n k8s-control01 -f ../talos/clusterconfig/cluster01-k8s-control01.dfw.56k.sh.yaml
talosctl apply-config -i -n k8s-control02 -f ../talos/clusterconfig/cluster01-k8s-control02.dfw.56k.sh.yaml
talosctl apply-config -i -n k8s-control03 -f ../talos/clusterconfig/cluster01-k8s-control03.dfw.56k.sh.yaml

# Configure the worker nodes
talosctl apply-config -i -n k8s-worker01 -f ../talos/clusterconfig/cluster01-k8s-worker01.dfw.56k.sh.yaml
talosctl apply-config -i -n k8s-worker02 -f ../talos/clusterconfig/cluster01-k8s-worker02.dfw.56k.sh.yaml
talosctl apply-config -i -n k8s-worker03 -f ../talos/clusterconfig/cluster01-k8s-worker03.dfw.56k.sh.yaml

# talosctl --talosconfig=./talosconfig config endpoint k8s-control01 k8s-control02 k8s-control03
# talosctl config merge ./talosconfig

# It will take a few minutes for the nodes to spin up with the configuration.  Once ready, execute
# talosctl --talosconfig=./talosconfig bootstrap -n k8s-control01

# It will then take a few more minutes for Kubernetes to get up and running on the nodes. Once ready, execute
# talosctl --talosconfig=./talosconfig kubeconfig -n k8s-control01
