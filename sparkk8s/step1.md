## Setup and run application

Get Helm
`wget -O helm-v3.2.1-linux-amd64.tar.gz https://get.helm.sh/helm-v3.2.1-linux-amd64.tar.gz`{{execute}}

Install the spark Operator
`linux-amd64/helm install incubator/sparkoperator --generate-name --namespace spark-operator --set sparkJobNamespace=default`{{execute}}

Create Cluster admin role
`kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default`{{execute}}

Get Service account
`kubectl apply -f spark-pi.yaml`{{execute}}

Change the serviceAccount line value to the value you got in the previous command
`vi spark-pi.yaml`{{execute}}

Run test application
`kubectl apply -f spark-pi.yaml`{{execute}}




