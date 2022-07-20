#!/bin/bash
ROOK_WORKERS="k8s-worker01 k8s-worker02 k8s-worker03"

for i in $ROOK_WORKERS; do
  echo "Wiping $i"
  cat wipe-rook.yaml | sed -e "s/HOSTNAME/$i/g" | kubectl apply -f -
done

for i in $ROOK_WORKERS; do
  echo "Waiting for $i to complete"
  kubectl wait --timeout=900s --for=jsonpath='{.status.phase}=Succeeded' pod disk-wipe-$i -n kube-system
  # kubectl delete pod disk-wipe-$i
done
