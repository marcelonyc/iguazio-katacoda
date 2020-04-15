#! /bin/bash 

# Wait for Kubernetes to come up


exec 2>&1
exec >> deployment.log

mkdir -p /tmp/mlrun/mlrun_course
mkdir /tmp/mlrun/data

sleep 2

export MLRUN_IP=localhost
export SHARED_DIR="/tmp/mlrun"
# On Windows, use host.docker.internal for MLRUN_IP

docker pull quay.io/iguazio/mlrun-ui:latest
docker pull mlrun/jupy:latest

docker run -it -p 4000:80 --rm -d --name mlrun-ui -e MLRUN_API_PROXY_URL=http://${MLRUN_IP}:8080 quay.io/iguazio/mlrun-ui:latest
docker run -it -p 8080:8080 -p 8888:8888 --rm -d --name jupy -v ${SHARED_DIR}:/home/jovyan/mlrun mlrun/jupy:latest


cp *.ipynb /tmp/mlrun/mlrun_course/.
cp *.py /tmp/mlrun/mlrun_course/.
cp start_mlrun.sh /tmp/mlrun/mlrun_course/.
sleep 1
chown -R 1000 /tmp/mlrun


echo "+++++++++++++++++++++" >>  deployment.log   2>&1
echo "DEPLOYMENT COMPLETED"  >>  deployment.log   2>&1
echo "+++++++++++++++++++++" >>  deployment.log   2>&1


