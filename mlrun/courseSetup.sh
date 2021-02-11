echo >>  deployment.log   2>&1
echo >>  deployment.log   2>&1
echo "+++++++++++++++++++++++++++++++++" >>  deployment.log   2>&1
echo "  WAITING FOR SERVICES TO START ">>  deployment.log   2>&1
echo "+++++++++++++++++++++++++++++++++">>  deployment.log   2>&1

docker network create mlrun-network
docker run -it -p 8080:8080 --rm -d --network mlrun-network --name mlrun-api mlrun/mlrun-api:0.6.0
docker run -it -p 8081:80 --rm -d --network mlrun-network --name mlrun-ui -e MLRUN_API_PROXY_URL=http://mlrun-api:8080 mlrun/mlrun-ui:0.6.0
docker run -p 8070:8070 -d --rm  --network mlrun-network -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp --name nuclio-dashboard quay.io/nuclio/dashboard:stable-amd64
update-alternatives --install /usr/local/bin/python python /usr/bin/python3.8 0
update-alternatives --install /usr/local/bin/pip pip /usr/local/bin/pip3 0
pip install mlrun==0.6.0
export MLRUN_DBPATH='http://localhost:8080'
echo "+++++++++++++++++++++" >>  deployment.log   2>&1
echo "DEPLOYMENT COMPLETED"  >>  deployment.log   2>&1
echo "+++++++++++++++++++++" >>  deployment.log   2>&1
