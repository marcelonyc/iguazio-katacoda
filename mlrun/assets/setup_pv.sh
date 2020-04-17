#! /bin/bash
echo "Create PVC and PV"
export FS_ROOT=${FS_ROOT//\//\\/}

cat pv_local.yaml | sed s/{{FS_ROOT}}/${FS_ROOT}/g > /tmp/pv_local.yaml
kubectl apply -f /tmp/pv_local.yaml >> deployment.log   2>&1
