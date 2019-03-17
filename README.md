# oc-cluster-up
Openshift All In One without network


# Software
Thirst execute:

   yum -y install jq-1.5-1.el7.x86_64
   
   yum -y install centos-release-openshift-origin311
   
   yum -y install origin-clients

Insert in your /etc/hosts following line :

<your-primary-ip> oclab
   

Then execute :

   mkdir /root/images
   
   (cd /root/images ; zcat /tmp/oc-cluste-up-allinone.cpio.gz |cpio -ivd)
   
   (cd /root/images/scritps; bash 01-rundr.bash; bash 02-oc-cluster-up.bash; bash oc-cluster-up.bash)
   
Now you have openshift cluster up running.
