##############################
# 1.使用openssl制作ca证书
# 2.自签发证书时,需要维护证书序列号(这个描述可能不正确)
##############################

#! /bin/sh
rm -rf demoCA
mkdir demoCA
echo 01 > demoCA/serial
touch demoCA/index.txt

# CA self certificate
openssl req  -new -batch -x509 -days 3650 -nodes -newkey rsa:2048 -out ca.pem -keyout ca.key -subj /CN=ca.localdomain/C=FR/ST=BdR/L=Aix/O=fD/OU=Tests