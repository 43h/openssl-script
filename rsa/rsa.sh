#! /bin/sh

#generate rsa key
openssl genrsa -out peer1.key 2048

#generate rsa cert-request
openssl req -new -batch -out peer1.csr -key peer1.key -subj /CN=peer1.cn/C=FR/ST=BdR/L=Aix/O=fD/OU=Tests

#issue certificate
openssl ca -cert ca.pem -keyfile ca.key -in peer1.csr -out peer1.pem -outdir . -batch