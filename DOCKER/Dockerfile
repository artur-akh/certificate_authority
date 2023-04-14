FROM ubuntu

ENV IP_DOMAIN=0.0.0.0 \
    CN_NAME="Root CA"

WORKDIR /root/

COPY entrypoint.sh .

RUN apt-get update && \
    apt-get install -y strongswan-pki && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x ./entrypoint.sh 

ENTRYPOINT ["./entrypoint.sh"]
STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]

