FROM alpine

MAINTAINER dojomi

RUN apk update
RUN apk --no-cache add openssl

CMD /usr/bin/openssl genrsa -out /ssl/${CERT_NAME_OUTPUT}.key 1024 && \
    /usr/bin/openssl req  -new -newkey rsa:4096 -days 365 -nodes -subj "/C=${COUNTRY_NAME}/ST=${STATE}/L=${CITY}/O=${ORGANIZATION_NAME}/CN=${COMMON_NAME}" -keyout /ssl/${CERT_NAME_OUTPUT}.key -out /ssl/${CERT_NAME_OUTPUT}.csr  && \
    /usr/bin/openssl x509 -req -days 365 -in /ssl/${CERT_NAME_OUTPUT}.csr -signkey /ssl/${CERT_NAME_OUTPUT}.key -out /ssl/${CERT_NAME_OUTPUT}.crt
