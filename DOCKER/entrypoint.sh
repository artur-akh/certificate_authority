#!/bin/bash

mkdir -p ~/pki && chmod 700 ~/pki

pki --gen --type rsa --size 4096 --outform pem > ~/pki/ca-key.pem
pki --self --ca --lifetime 3650 --in ~/pki/ca-key.pem \
    --type rsa --dn "CN=$CN_NAME" --outform pem > ~/pki/ca-cert.pem

# ------------------CLIENT------------------------
pki --gen --type rsa --size 4096 --outform pem > ~/pki/server-key.pem

if [[ $IP_DOMAIN == *[0-9]* ]] 
then  
    pki --pub --in ~/pki/server-key.pem --type rsa \
        | pki --issue --lifetime 1825 \
            --cacert ~/pki/ca-cert.pem \
            --cakey ~/pki/ca-key.pem \
            --dn "CN=$IP_DOMAIN" --san @$IP_DOMAIN --san $IP_DOMAIN \
            --flag serverAuth --flag ikeIntermediate --outform pem \
        >  ~/pki/server-cert.pem
else
    pki --pub --in ~/pki/server-key.pem --type rsa \
        | pki --issue --lifetime 1825 \
            --cacert ~/pki/ca-cert.pem \
            --cakey ~/pki/ca-key.pem \
            --dn "CN=$IP_DOMAIN" --san $IP_DOMAIN \
            --flag serverAuth --flag ikeIntermediate --outform pem \
        >  ~/pki/server-cert.pem
fi

exec "$@"