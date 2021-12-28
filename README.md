# openssl-script
---
跟新于 2021-12-28
opnessl和gmssl脚本<br>

由于[openssl(1.1.1)](https://www.openssl.org/)不支持签发国密(sm2/3/4)证书<br>
国密证书使用[Gmssl](http://gmssl.org/)做<br>

## 文件
* type.md
> 一般证书密钥用法

* rsa 
> 制作RSA自签名证书脚本

* sm
> 制作国密自签名证书

* conf
> 证书用途配置文件