#!/bin/bash

read -p "This will bootstrap the development environment. Are you sure to continue? (y|n) " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

# cd the app's root directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
APP_PATH="$(dirname $(dirname $DIR))"
cd $APP_PATH

# generate a development SSL certificate
cd docker/apache2/conf/ssl
openssl genrsa -des3 -passout pass:foobar -out wpdocker.local.pem 2048
openssl req -passin pass:foobar -new -sha256 -key wpdocker.local.pem -subj "/C=US/ST=CA/O=wpdocker, Inc./CN=wpdocker.local" -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:wpdocker.local,DNS:www.wpdocker.local")) -out wpdocker.local.csr
openssl x509 -passin pass:foobar -req -days 365 -in wpdocker.local.csr -signkey wpdocker.local.pem -out wpdocker.local.crt
openssl rsa -passin pass:foobar -in wpdocker.local.pem -out wpdocker.local.key

# write more commands if required to set up your environment
