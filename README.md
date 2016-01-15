#Fluentd and Fluentd-forwarding
##Steps for deploy
###1) Deploy coco.yml
    docker-compose -f coco.yml up
    coco is a container that emulates the cloudopting machine
###2) Deploy monitor.yml into coco
    docker exec -it coco bash
    cd /home/coco/compose
    docker-compose -f monitor.yml
monitor.yml deploys three containers into coco, fluentd (port 24224), elasticsearch and kibana (port 5601)
fluentd uses a ssl connection
###3) Deploy into "virtual machine" with cloudopting-crane
**Note:** we will not use a real virtual machine, we'll use emulatedhost with cloudopting-crane in development mode.
####3.1) Clone cloudopting-crane project
git clone https://github.com/CloudOpting/cloudopting-crane.git
####3.2) Deploy cloudopting-crane
    ./genCerts
    docker-compose -f development.yml up
####3.3) Use the crane interfaces in 127.0.0.1:8888
######Context:
group:empty o default
puppetfile: use ./covm/puppetfile

######Images:
name: apache
dockerfile: ./covm/apache/Dockerfile
manifest: empty

name: tomcat
dockerfile: ./covm/tomcat/Dockerfile
manifest: ./covm/tomcat/tomcat.pp

name: fforwarding
dockerfile: ./covm/fluentd-forwarding/Dockerfile
manifest: ./covm/fluentd-forwarding/manifest.pp

######Cluster:
ProvisioedSingleManchine: endpoint: http://emulatedhost:4243

######Composer:
composefile: fluentd-forwarding.yml
composefile: application.yml
**Note:**First you must deploy fluentd-forwarding.yml
#Real case considerations
####Cloudopting machine
######1) You don't need deploy coco, you must deploy monitor.yml
######2) In monitor.yml: Replace the cert path and conf path
######3) In cloudopting.conf: Change shared-key, ca_private_key_passphrase and certificates names
##Virtual machine
######1) Puppetfile is necesary, although it's empty
######2) You must deploy fluentd-forwarding.yml before application.yml
######3) fforwarding.pp:
Shared_key: use the same key that fluentd from cloudopting machine
ca_cert.pem: Replace with your certificate
######4) fluentd-forwarding.yml:
Replace host certificates path
Replace coco IP address with cloudopting machine IP