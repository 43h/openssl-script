##
#使用特定配置文件，生成特定作用的证书
##
#! /bin/sh
./lc.sh

mkdir demoCA
echo 01 > demoCA/serial
touch demoCA/index.txt
echo "unique_subject = no" >  demoCA/index.txt.attr

# CA self certificate
openssl req  -new -batch -x509 -days 3650 -nodes -newkey rsa:2048 -out ca-cert.pem -keyout ca.key -subj /C=CN/ST=GD/L=SZ/O=TEST/OU=NULL/CN="TEST EV Root CA" -config ../conf/ca.conf
