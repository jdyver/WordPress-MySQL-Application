#!/bin/bash

# WordPressExample.sh up | down
# - Up offline is default (using local files)
# - Down removes the app

# Requires: Kubectl setup to k8s cluster

# TODO - Check kubectl get nodes

case "$1" in
up)
	echo "WordPressExample.sh - Online"
	echo
#    kubectl apply -k ./Files/
            # $ kubectl apply -k ./Files/
            # secret/mysql-pass-fc4g29gt4c created
            # service/wordpress-mysql created
            # service/wordpress created
            # deployment.apps/wordpress-mysql created
            # deployment.apps/wordpress created
            # persistentvolumeclaim/mysql-pv-claim created
            # persistentvolumeclaim/wp-pv-claim created
    echo "Secrets - kubectl get secrets"
    echo
    while true
	do
            # $ kubectl get secrets
            # NAME                    TYPE                                  DATA   AGE
            # default-token-882lh     kubernetes.io/service-account-token   3      128m
            # mysql-pass-fc4g29gt4c   Opaque                                1      2m12s
        TASK=$(kubectl get secrets | grep mysql-pass | awk '{print $2}' | grep Opaque)
        if [ "$TASK" != "Opaque" ]
        then
            printf "."
        else
            echo
            echo "WordPressExample.sh - WordPress Secret Created"
            echo "$ kubectl get secrets"
            TASK=$(kubectl get secrets)
            echo "$TASK"
            echo
            break
        fi
    	sleep 10
	done
    
    echo "Persistent Storage Claims - kubectl get pvc"
    echo
    while true
	do
            # $ kubectl get pvc
            # NAME             STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS     AGE
            # mysql-pv-claim   Bound    pvc-7cb74f0a-702a-11e9-a26b-0a4489458944   20Gi       RWO            ebs-csi-driver   4m54s
            # wp-pv-claim      Bound    pvc-7cd30722-702a-11e9-a26b-0a4489458944   20Gi       RWO            ebs-csi-driver   4m54s
        TASK=$(kubectl get pvc | grep mysql | awk '{print $2}' | grep Bound)
        if [ "$TASK" != "Bound" ]
        then
            printf "."
        else
            echo
            echo "WordPressExample.sh - WordPress MySQL Storage Bind Created"
            echo "$ kubectl get pvc"
            TASK=$(kubectl get pvc | grep NAME)
            echo "$TASK"
            echo
            break
        fi
    	sleep 10
    done        
            # $ kubectl get pods
            # NAME                               READY   STATUS    RESTARTS   AGE
            # wordpress-599d5b78f6-7kksv         1/1     Running   0          5m4s
            # wordpress-mysql-767cb86586-hclv8   1/1     Running   0          5m4s
            # $ kubectl get services
            # NAME              TYPE           CLUSTER-IP    EXTERNAL-IP                                                               PORT(S)        AGE
            # kubernetes        ClusterIP      10.0.0.1      <none>                                                                    443/TCP        136m
            # wordpress         LoadBalancer   10.0.41.182   a7c5e8cc1702a11e9a26b0a448945894-1706311152.us-west-2.elb.amazonaws.com   80:30203/TCP   9m57s
            # wordpress-mysql   ClusterIP      None          <none>                                                                    3306/TCP       9m57s
    echo "WordPress is up and accessible at: <External-IP Above>
    ** Login and setup username and password or remove application immediately **"
    echo
	;;
down)
	echo "WordPressExample.sh - Down"
	echo
    kubectl delete -k ./Files/
	echo "WordPressExample.sh - Application Removed"
	echo
	;;
*)
	echo "Fail - WordPressExample.sh up | down 
	- Error in Argument 1"
	echo
	exit
	;;
esac