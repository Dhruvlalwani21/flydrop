#!/bin/sh

cnf_dir='/mnt/openssl/'
certs_dir='/etc/ssl/certs/'
openssl req -config ${cnf_dir}flydropCA.cnf -new -x509 -days 1 -keyout ${certs_dir}flydropCA.key -out ${certs_dir}flydropCA.crt
openssl req -config ${cnf_dir}flydropCert.cnf -new -out /tmp/flydrop-dev.csr -keyout ${certs_dir}flydrop-dev.key
openssl x509 -req -in /tmp/flydrop-dev.csr -CA ${certs_dir}flydropCA.crt -CAkey ${certs_dir}flydropCA.key -CAcreateserial -extensions req_ext -extfile ${cnf_dir}flydropCert.cnf -sha512 -days 1 -out ${certs_dir}flydrop-dev.crt

exec "$@"