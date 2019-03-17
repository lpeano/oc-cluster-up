INSTALLPATH=/root/images/

[[ ! -d dockerdata ]] && mkdir dockerdata
docker run -it --rm --entrypoint cat registry:2 \
/etc/docker/registry/config.yml > dockerdata/config.yml
