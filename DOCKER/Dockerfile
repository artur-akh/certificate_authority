FROM ubuntu

ENV IP_DOMAIN=0.0.0.0 \
    CN_NAME="Root CA"

WORKDIR /root/

COPY entrypoint.sh .

RUN apt-get -y update && apt-get -y install \
    strongswan-pki \
    && chmod +x ./entrypoint.sh 

ENTRYPOINT ["./entrypoint.sh"]
STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]

