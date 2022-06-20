##
#使用特定配置文件，生成特定作用的证书
##
#! /bin/sh
./lc.sh

mkdir demoCA
echo 01 > demoCA/serial
touch demoCA/index.txt

# CA self certificate
openssl req  -new -batch -x509 -days 3650 -nodes -newkey rsa:2048 -out ca-cert.pem -keyout ca.key -subj /C=CN/ST=GD/L=SZ/O=TEST/OU=NULL/CN="TEST EV Root CA" -config ../conf/ca.conf

#issue a certificate for the web server
openssl genrsa -out peer1.key 2048
openssl req -new -batch -out peer1.csr -key peer1.key -subj /CN=peer1.cn/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL -batch -config ../conf/web.conf
openssl ca -cert ca-cert.pem -keyfile ca.key -in peer1.csr -out peer1-cert.pem -outdir . -batch -config ../conf/web.conf 