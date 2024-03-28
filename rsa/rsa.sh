#! /bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 domain name"
    echo "example: $0 baidu.com"
    exit 1
fi

#generate rsa key
openssl genrsa -out $1.key 2048

#generate rsa cert-request
openssl req -new -batch -out $1.csr -key $1.key -subj /CN=$1/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL

#issue certificate
openssl ca -cert ca-cert.pem -keyfile ca.key -in $1.csr -out $1.pem -outdir . -batch

#
rm -rf $1.csr