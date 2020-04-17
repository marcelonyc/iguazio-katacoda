#! /bin/bash 

if [ "${FS_ROOT}x" = "x" ]
then
	export FS_ROOT="/tmp/mlrun"
fi
sleep 1
echo ${FS_ROOT} >> deployment.log

# Wait for Kubernetes to come up
kubectl get pods > /dev/null
while [ $? -ne 0 ]
do
        sleep 10
	kubectl get pods > /dev/null
done

echo "Create PVC and PV"
./setup_pv.sh ${FS_ROOT} >> deployment.log   2>&1

echo "Create Nginix"
kubectl run nginx --image=nginx --replicas=1 >> deployment.log 2>&1


mkdir -p ${FS_ROOT}/mlrun_course
mkdir ${FS_ROOT}/data

sleep 2

./setup_registry.sh >> deployment.log   2>&1


echo "Deploy Jupyter"
./setup_jupyter.sh   >> deployment.log   2>&1


echo "Deploy MLRun API"
./setup_mlrunui.sh >> deployment.log   2>&1

echo
echo 
echo "+++++++++++++++++++++++++++++++++"
echo "  WAITING FOR SERVICES TO START "
echo "+++++++++++++++++++++++++++++++++"

kubectl get pods|grep jupy|grep Runn > /dev/null
while [ $? -ne 0 ]
do
     sleep 10
     kubectl get pods|grep jupy|grep Runn > /dev/null
done

clear
echo
echo
echo
echo

cp *.ipynb ${FS_ROOT}/mlrun_course/.
cp *.py ${FS_ROOT}/mlrun_course/.
cp start_mlrun.sh ${FS_ROOT}/mlrun_course/.
sleep 1
chown -R 1000 ${FS_ROOT}

kubectl exec  `kubectl get pods |grep jupyter |awk '{print $1}'` /home/jovyan/mlrun/mlrun_course/start_mlrun.sh

echo "+++++++++++++++++++++" >>  deployment.log   2>&1
echo "DEPLOYMENT COMPLETED"  >>  deployment.log   2>&1
echo "+++++++++++++++++++++" >>  deployment.log   2>&1
