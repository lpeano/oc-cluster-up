cd certs
openssl req -new -key  server.key -out server.csr -config cert.csan.config -batch
cd -
