# oc-cluster-up
Openshift All In One without network


# Software
Thirst execute:

   yum install docker -y

   yum install epel-release -y

   yum install jq -y
   
   yum -y install centos-release-openshift-origin311
   
   yum -y install origin-clients

Insert in your /etc/hosts following line :

<your-primary-ip> oclab
   

Then execute :
   
   
   
   mkdir /root/images
   
   tar zxvf /tmp/oc-cluster-up-scripts.tar.gz
   
   .... TODO DOCS ...
   
   (cd /root/images/scritps; bash 01-rundr.bash; bash 02-oc-cluster-up.bash; bash oc-cluster-up.bash)
   
Now you have openshift cluster up running.
