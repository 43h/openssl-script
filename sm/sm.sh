##
# 国密证书制作脚本
# 国密ipsec需要双证
##

#! /bin/sh

rm *.key *.pem *.csr
rm -rf demoCA
mkdir demoCA
echo 01 > demoCA/serial
touch demoCA/index.txt
echo "unique_subject = no" >  demoCA/index.txt.attr


# CA self certificate
./GmSSL-master/apps/gmssl ecparam -genkey -name sm2p256v1 -out ca.key
./GmSSL-master/apps/gmssl req -new -key ca.key -out ca.csr -subj /CN=ca.cn/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL -config ../conf/ca.conf
./GmSSL-master/apps/gmssl req -x509 -sm3 -days 3650 -key ca.key -in ca.csr -out ca.cert.pem  -subj /CN=ca.cn/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL -config ../conf/ca.conf

#peer1
./GmSSL-master/apps/gmssl ecparam -genkey -name sm2p256v1 -out peer1.enc.key
./GmSSL-master/apps/gmssl ecparam -genkey -name sm2p256v1 -out peer1.sig.key
./GmSSL-master/apps/gmssl req -new -key peer1.enc.key -out peer1.enc.csr -subj /CN=peer1.cn/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL -config ../conf/enc.conf -batch
./GmSSL-master/apps/gmssl req -new -key peer1.sig.key -out peer1.sig.csr -subj /CN=peer1.cn/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL -config ../conf/sig.conf -batch
./GmSSL-master/apps/gmssl ca -md sm3 -cert ca.cert.pem -keyfile ca.key -in peer1.enc.csr -out peer1.enc.pem -days 365 -outdir .  -config ../conf/enc.conf -batch
./GmSSL-master/apps/gmssl ca -md sm3 -cert ca.cert.pem -keyfile ca.key -in peer1.sig.csr -out peer1.sig.pem -days 365 -outdir . -config ../conf/sig.conf -batch

#peer2
./GmSSL-master/apps/gmssl ecparam -genkey -name sm2p256v1 -out peer2.enc.key
./GmSSL-master/apps/gmssl ecparam -genkey -name sm2p256v1 -out peer2.sig.key
./GmSSL-master/apps/gmssl req -new -key peer2.enc.key -out peer2.enc.csr -subj /CN=peer2.cn/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL -config ../conf/enc.conf
./GmSSL-master/apps/gmssl req -new -key peer2.sig.key -out peer2.sig.csr -subj /CN=peer2.cn/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL -config ../conf/sig.conf
./GmSSL-master/apps/gmssl ca -md sm3 -cert ca.cert.pem -keyfile ca.key -in peer2.enc.csr -out peer2.enc.pem -days 365 -outdir . -batch -config ../conf/enc.conf
./GmSSL-master/apps/gmssl ca -md sm3 -cert ca.cert.pem -keyfile ca.key -in peer2.sig.csr -out peer2.sig.pem -days 365 -outdir . -batch -config ../conf/sig.conf