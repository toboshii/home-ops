#!/bin/bash

# Reset the worker nodes first since the path to them is through the control plane nodes
talosctl reset --graceful=false --reboot -n k8s-control01 -e k8s-control01
talosctl reset --graceful=false --reboot -n k8s-control02 -e k8s-control02
talosctl reset --graceful=false --reboot -n k8s-control03 -e k8s-control03

echo "Waiting for workers to reset... ^C to stop here"
sleep 5

# Reset the control plane nodes
talosctl reset --graceful=false --reboot -n k8s-worker01 -e k8s-worker01
talosctl reset --graceful=false --reboot -n k8s-worker02 -e k8s-worker02
talosctl reset --graceful=false --reboot -n k8s-worker03 -e k8s-worker03
