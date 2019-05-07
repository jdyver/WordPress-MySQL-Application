# WordPress-MySQL-Application
Deploying WordPress and MySQL with Persistent Volumes
## https://github.com/jdyver/WordPress-MySQL-Application.git   

### WordPressExample.sh up | down
- Up offline is default (using local files)
- Down

### Requirement:
Kubectl is setup to k8s cluster

### Probably needs to be done:
- TODO: 

### WordPressExample.sh up
```
$ bash WordPressExample.sh up
WordPressExample.sh - Online

secret/mysql-pass-fc4g29gt4c created
service/wordpress-mysql created
service/wordpress created
deployment.apps/wordpress-mysql created
deployment.apps/wordpress created
persistentvolumeclaim/mysql-pv-claim created
persistentvolumeclaim/wp-pv-claim created

Secrets - kubectl get secrets

WordPressExample.sh - WordPress Secret Created
 $ kubectl get secrets
 NAME                    TYPE                                  DATA   AGE
default-token-dh7zc     kubernetes.io/service-account-token   3      87m
mysql-pass-fc4g29gt4c   Opaque                                1      17m

Persistent Storage Claims - kubectl get pvc

WordPressExample.sh - MySQL Storage Bind Created
 $ kubectl get pvc
 NAME             STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS     AGE
 mysql-pv-claim   Bound    pvc-0638d32a-70cf-11e9-b1b9-0adcd524b774   20Gi       RWO            ebs-csi-driver   17m

WordPressExample.sh - WordPress Storage Bind Created
 $ kubectl get pvc
 NAME             STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS     AGE
 wp-pv-claim      Bound    pvc-065a5880-70cf-11e9-b1b9-0adcd524b774   20Gi       RWO            ebs-csi-driver   17m


WordPressExample.sh - WordPress Deployment Up

WordPressExample.sh - MySQL Deployment Up

WordPress is up and accessible at: http://a05da6ae570cf11e9b1b90adcd524b77-864141371.us-west-2.elb.amazonaws.com
            ** Login and setup username and password or remove application immediately **

```

### WordPressExample.sh down
```
$ bash WordPressExample.sh down
WordPressExample.sh - Down

secret "mysql-pass-fc4g29gt4c" deleted
service "wordpress-mysql" deleted
service "wordpress" deleted
deployment.apps "wordpress-mysql" deleted
deployment.apps "wordpress" deleted
persistentvolumeclaim "mysql-pv-claim" deleted
persistentvolumeclaim "wp-pv-claim" deleted

WordPressExample.sh - Application Removed

```