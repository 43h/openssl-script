
if [ $# -ne 1 ]; then
    echo "Usage: $0 domain name"
    echo "example: $0 baidu.com"
    exit 1
fi

cp ../conf/web.conf ./web.conf
if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	echo "Parameter is an IP address"
    sed -i 's/^DNS.*//g' web.conf
	sed -i "s/^IP\.1.*/IP\.1 = $1/g" web.conf
else
	echo "Parameter is a domain name"
	sed -i "s/^DNS\.1.*/DNS\.1 = $1/g" web.conf
	sed -i 's/^IP.*//g' web.conf
fi

#issue a certificate for the web server
openssl genrsa -out $1.key 2048
openssl req -new -batch -out $1.csr -key $1.key -subj /CN=$1/C=CN/ST=GD/L=SZ/O=TEST/OU=NULL -batch -config web.conf
openssl ca -cert ca-cert.pem -keyfile ca.key -in $1.csr -out $1-cert.pem -outdir . -batch -config web.conf 
rm -rf $1.csr
rm -rf web.conf