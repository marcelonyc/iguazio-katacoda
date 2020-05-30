## Monitor the application

Driver and workers show when running. You should see spark-pi-driver and one worker

`kubectl get pods`{{execute}}

List all Spark applications kubectl get sparkapplications

Detailed list in JSON format Watch state under status

`kubectl get sparkapplications -o json`{{execute}}`

Watch the job execution

`kubectl logs spark-pi-driver -f`{{execute}}
