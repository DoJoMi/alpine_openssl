```
# generate new ssl-certifates
docker volume create --name ssl
docker build -t dojomi/openssl .

docker run --rm \
-e COUNTRY_NAME= \
-e STATE= \
-e CITY= \
-e ORGANIZATION_NAME= \
-e COMMON_NAME= \
-e CERT_NAME_OUTPUT= \
-v ssl:/ssl \
dojomi/openssl
```
