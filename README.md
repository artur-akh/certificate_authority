**Запуск контейнера Certificate authority и вывод сертификатов на экран:**<br>
```bash
docker run --name ca --rm -it \
-e IP_DOMAIN=0.0.0.0 \
-e CN_NAME="Root CA" \
arturakh/certificate_authority:latest bash -c 'cd pki && echo "--ca-cert.pem--" && cat ca-cert.pem && echo "--server-cert.pem--" && cat server-cert.pem && echo "--server-key.pem--" && cat server-key.pem'
```