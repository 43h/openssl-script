##
#如果要制定证书用途,需要在配置文件中指明,并在命令中引用配置文件
##


#! /bin/sh
#./lc.sh

#mkdir demoCA
#echo 01 > demoCA/serial
#touch demoCA/index.txt

# CA self certificate
openssl req  -new -batch -x509 -days 3650 -nodes -newkey rsa:2048 -out cacert.pem -keyout cakey.pem -subj /C=CN/ST=GD/L=SZ/O=GENEW/OU=NC/CN="Genew EV Root CA" -config ../conf/ca.conf

#peer
openssl genrsa -out peer1.key.pem 2048
openssl req -new -batch -out peer1.csr.pem -key peer1.key.pem -subj /CN=peer3.cn/C=CN/ST=GD/L=SZ/O=GENEW/OU=NC -batch -config ../conf/web.conf
openssl ca -cert cacert.pem -keyfile cakey.pem -in peer1.csr.pem -out peer1.cert.pem -outdir . -batch -config ../conf/web.conf 