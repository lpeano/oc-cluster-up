INSTALLPATH="/root/images/"

oc cluster up  --skip-registry-check=true  --base-dir=${INSTALLPATH}/oclab --image='oclab:6666/origin-${component}:${version}'  --public-hostname=oclab  --routing-suffix='' --insecure-skip-tls-verify=true --write-config=true
