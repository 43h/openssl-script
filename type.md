# 证书类型

---
以下内容收集于互联网,<br>
证书用法未与标准文档校准<br>

## 证书作用
```txt
 KeyUsage ::= BIT STRING {
           digitalSignature        (0),
           nonRepudiation          (1),
           keyEncipherment         (2),
           dataEncipherment        (3),
           keyAgreement            (4),
           keyCertSign             (5),
           cRLSign                 (6),
           encipherOnly            (7),
           decipherOnly            (8) }
```
详见RFC3280

## 根证书
密钥用法：认可签名，证书签名，CRL签名
keyUsage=nonRepudiation, keyCertSign,cRLSign

## 代码签名
密钥用法：数字签名
增强密钥用法：代码签名
keyUsage=digitalSignature
extendedKeyUsage=codeSigning

## 计算机
密钥用法：数字签名，密钥协商
增强密钥用法：服务器验证，客户端验证
keyUsage=digitalSignature,keyAgreement
extendedKeyUsage=serverAuth,clientAuth

## WEB服务器
密钥用法：数字签名，认证签名，密钥加密，数据加密，密钥协商
增强密钥用法：服务器验证
keyUsage=digitalSignature,nonRepudiation,keyEncipherment,dataEncipherment,keyAgreement
extendedKeyUsage=serverAuth

## 客户端
密钥用法：数字签名，认可签名，密钥加密，数据加密
增强密钥用法：客户端验证
keyUsage=digitalSignature,nonRepudiation,keyEncipherment,dataEncipherment
extendedKeyUsage=clientAuth

## 信任列表签名
密钥用法：数字签名
增强密钥用法：信任列表签名
keyUsage=digitalSignature
extendedKeyUsage=msCTLSign

## 时间戳
密钥用法：数字签名，认可签名，密钥加密，数据加密
增强密钥用法：时间戳
keyUsage=digitalSignature,nonRepudiation,keyEncipherment,dataEncipherment
extendedKeyUsage=timeStamping

## IPSEC
密钥用法：数字签名，认可签名，密钥加密，数据加密
增强密钥用法：IP安全IKE中级
keyUsage=digitalSignature,nonRepudiation,keyEncipherment,dataEncipherment
extendedKeyUsage=1.3.6.1.5.5.8.2.2

## 安全Email
密钥用法：数字签名，认可签名，密钥加密，数据加密
增强密钥用法：安全电子邮件
keyUsage=digitalSignature,nonRepudiation,keyEncipherment,dataEncipherment
extendedKeyUsage=emailProtection

## 智能卡登陆
密钥用法：数字签名，密钥协商，仅仅解密
增强密钥用法：密钥恢复，加密文件系统，智能卡登陆
keyUsage=digitalSignature,keyAgreement,decipherOnly
extendedKeyUsage=1.3.6.1.4.1.311.10.3.11,msEFS,1.3.6.1.4.1.311.20.2.2