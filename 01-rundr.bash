INSTALLPATH="/root/images/"
CERTSPATH=${INSTALLPATH}/certs/
mkdir  $INSTALLPATH/backup
openssl req -new -key  ${CERTSPATH}/server.key -out  ${CERTSPATH}/server.csr -config ${CERTSPATH}/cert.csan.config -batch
openssl x509 -req -days 3650 -in ${CERTSPATH}/server.csr -signkey ${CERTSPATH}/server.key -out ${CERTSPATH}/server.crt
echo backingup /etc/docker/daemon.json to $INSTALLPATH/backup
cp /etc/docker/daemon.json  $INSTALLPATH/backup
jq --argjson insecure '"oclab:6666"'  '."insecure-registries"|=.+[$insecure]'  $INSTALLPATH/backup/daemon.json > /etc/docker/daemon.json
echo restarting docker 
systemctl restart docker

docker run -d \
  --restart=always \
  --name registry \
  -v ${INSTALLPATH}/volumes/certs:/certs:ro,z \
  -v ${INSTALLPATH}/volumes/registry:/var/lib/registry:rw,z \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/server.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/server.key \
  -p 6666:443 \
  --user 0:0 \
  registry:2
