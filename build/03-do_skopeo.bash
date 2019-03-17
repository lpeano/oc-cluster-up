INSTALLPATH=/root/images/
for i in $(ls ${INSTALLPATH}/dockerimages/origin*)
do
echo 	 skopeo copy --dest-tls-verify=false  docker-archive:$i  docker://oclab:6666/$i:v3.11
done;
