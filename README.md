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
OUTPUT
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