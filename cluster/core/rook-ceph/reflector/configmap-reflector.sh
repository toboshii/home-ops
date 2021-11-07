#!/usr/bin/env sh

set -o nounset
set -o errexit
# space delimited configmaps to copy
configmaps="${CONFIGMAPS}"
# source namespace to reflect configmap from
namespace_source="rook-ceph"
# space delimited namespace where to reflect the configmaps to
namespace_destination="backup-system"
for configmap in ${configmaps}; do
    configmap_source_content="$(kubectl get configmap "${configmap}" -n "${namespace_source}" -o json | jq 'del(.metadata.managedFields, .metadata.creationTimestamp, .metadata.resourceVersion, .metadata.uid, .metadata.ownerReferences)')"
    configmap_source_checksum="$(echo "${configmap_source_content}" | jq 'del(.metadata.namespace)' | md5sum | awk '{ print $1 }')"
    for namespace in ${namespace_destination}; do
        if kubectl get configmap "${configmap}" -n "${namespace}" >/dev/null 2>&1; then
            configmap_dest_content="$(kubectl get configmap "${configmap}" -n "${namespace}" -o json | jq 'del(.metadata.managedFields, .metadata.creationTimestamp, .metadata.resourceVersion, .metadata.uid, .metadata.ownerReferences)')"
            configmap_dest_checksum="$(echo "${configmap_dest_content}" | jq 'del(.metadata.namespace)' | md5sum | awk '{ print $1 }')"
            if [ "${configmap_source_checksum}" != "${configmap_dest_checksum}" ]; then
                echo "${configmap_source_content}" |
                    jq -r --arg namespace "$namespace" '.metadata.namespace = $namespace' |
                    kubectl replace -n "${namespace}" -f -
            fi
        else
            echo "${configmap_source_content}" |
                jq -r --arg namespace "$namespace" '.metadata.namespace = $namespace' |
                kubectl apply -n "${namespace}" -f -
        fi
    done
done
