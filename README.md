**Запуск контейнера BIND с двумя хостами:**<br>
```bash
docker run --name ca --rm -it \
-e IP_DOMAIN=0.0.0.0 \
-e CN_NAME="Root CA" \
arturakh/certificate_authority:latest bash
```