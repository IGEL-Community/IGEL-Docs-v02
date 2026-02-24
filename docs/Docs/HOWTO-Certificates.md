# HOWTO Certificates

-----

-----

## [SSL: Who Do You Trust?](https://datacenteroverlords.com/2011/09/25/ssl-who-do-you-trust/?utm_source=chatgpt.com)

- Let’s say you’re in the market for a starship.  You’re looking for a sporty model with warp drive, heated seats, and most importantly, a holodeck. You go to your local Starfleet dealer, and you find this guy....  Ensign Tony.

-----

-----

## Certificates/PKI Basics

### SSL/TLS Encryption

- The foundation of the modern internet – data in transport should be encrypted!

![01](Images/HOWTO-Certificates-01.png)

### Asymmetric vs. Symmetric Encryption

Symmetric and asymmetric encryption are two types of keys that have different features and uses:

- Symmetric encryption uses the same key to encrypt and decrypt data.
- Asymmetric encryption uses two separate keys, one for encryption (public key) and one for decryption (private key).
- Symmetric encryption is faster and uses shorter keys (usually 128 or 256 bits).
- Asymmetric encryption is more secure and uses longer keys (sometimes 2048 bits or longer).

![02](Images/HOWTO-Certificates-02.png)

### x.509 Certificates

- The binding of a public/private key to a specific identity
- Certificate items of note:
    - Subject DN – The entity a certificate belongs to. Contains organization name, country code, department, etc.
    - Common Name – The domain being secured. Part of the Subject DN. Can be a wildcard (*)
    - Issuer – The entity that signed and verified the certificate
    - Validity Period – Certs are only considered valid for a set period of time
    - Public Key/Public Key Algorithm
    - X.509 extensions – the most common are Subject Alternative Names (SANs)

### Certificate File Types & Encoding Formats

- PEM/Base64 - Most popular/supported encoding format, with plaintext headers at the beginning and end of the encoded data. Extensions include .crt, .cer, .pem (individual certs), .key (individual encrypted private key)
- P7B/PKCS#7 – Certificate chains/bundles encoded in Base64, can NOT contain private keys.
- DER/Binary - Encoding format that does NOT have plaintext/readable headers. Common extensions include .cer and .der
- PFX/P12/PKCS#12 – Binary format that can contain the certificate chain AND private key in a single .pfx or .p12 file. 

**NOTES:**

- Use Base64 for everything, don't rely on file extensions, .pfx files may need to be broken open using OpenSSL!

- The certificates must be available in the Base64 file format encoded with the file extension .pem, .crt or .cer.

- [IGEL KB: Upload and Assign Files in the IGEL UMS Web App](https://kb.igel.com/en/universal-management-suite/current/upload-and-assign-files-in-the-igel-ums-web-app)

    - Classification Type: SSL Certificate

-----

## Certificate Example – IGEL.com

### Certificate Chains & Authorities

- How can we trust that the identity information within a certificate is true and accurate?
- It's impossible to verify each endpoint certificate, so modern operating systems instead rely on a trusted third party to sign these certs – a certificate authority
- Modern operating systems contain a list trusted Root CAs – from those Root CAs, trust propagates downward
    - [KB: CA Certificates in IGEL OS](https://kb.igel.com/en/igel-os/current/which-ca-certificates-are-contained-in-igel-os)
    - [Microsoft Trusted CAs](https://learn.microsoft.com/en-us/security/trusted-root/participants-list)

![03](Images/HOWTO-Certificates-03.png)

### Certificate Chains & Authorities

![04](Images/HOWTO-Certificates-04.png)

### PKI Basics – Microsoft Enterprise CA

- Windows server role – typically on standalone machine(s) in a multi-tiered configuration, but can be installed alongside your DC for lab purposes
- Will generate a CA certificate upon role setup – this CA certificate is used to issue endpoint certificates
- By default, domain joined Windows devices will add Enterprise CA certificates to your trust store.
- Certificate issuance is usually handled via templates

![05](Images/HOWTO-Certificates-05.png)

-----

## Certificates in OS 11

### Common Scenario 1 – LDAPS in UMS

- Confirm that you have an Enterprise CA and an endpoint cert bound to your domain controller
- We are looking for the ROOTMOST certificate, not an individual domain controller certificate!
- From a domain controller, we can go to certificates.mmc and follow the endpoint cert up:

![06](Images/HOWTO-Certificates-06.png)
![07](Images/HOWTO-Certificates-07.png)

### Common Scenario 2 – ICG With a Public CA

- Fill out a CSR for your CA of choice, ensuring that they have SANs for ALL ICG URLs they may be using (or a wildcard!)
- Private keys are generated alongside the CSR – save it!
- You will need:
    - The endpoint cert private key, decrypted in Base64
    - The endpoint, intermediate and root certificates, in individual files in Base64 format
- Import in order – don’t forget the private key

### Common Scenario 3 – Certificate File Objects

- Common Certificate (all purpose) will serve most of your needs – less permissions management!
- Double check your certificate under /wfs/ca-certs

![08](Images/HOWTO-Certificates-08.png)

- Reverse engineering – follow that file object in the journal

![09](Images/HOWTO-Certificates-09.png)

-----

-----

## UMS Command Line Tool to Export UMS Web Certificate

### List Web Certs

```bash linenums="1"
umsadmin-cli web-certs list
```

```bash linenums="1"
NAME             FINGERPRINT (SHA1)                       EXPIRATION DATE USED 
230623-ums12-ron 351B4DA62D5A304C5B86401FB2C49091490EA5AE      2026-04-25 true 
1264447657       B18CB74C0CA7A54CFCB7AA162E32F2380205D111      2043-03-23 true 
230623-ums12-ron BB8F25B169B38DEE641FB160C93A303946219F41      2025-05-25 false
```

### List Assigned Server

```bash linenums="1"
umsadmin-cli web-certs list-assigned-server -f 351B4DA62D5A304C5B86401FB2C49091490EA5AE
```

```bash linenums="1"
HOST      LAST KNOWN IP PROCECSS ID                          VERSION  
igelums12 10.0.0.35     13078f0d-2161-49da-a09a-2ff074439bfe 12.09.110
```

### Export Cert Chain

```bash linenums="1"
mkdir yourkeystore.keystore
umsadmin-cli web-certs export-cert-chain -f 351B4DA62D5A304C5B86401FB2C49091490EA5AE -k yourkeystore.keystore --password:in
```

```bash linenums="1"
Password: 
Confirm: 
```

-----

-----

## Java keytool

**Note:** Install java on your device to have `keytool`. `keytool` is installed on UMS (`/opt/IGEL/RemoteManager/_jvm/bin`)

Java `keytool` command can be used to extract private key and certificate chain from the exported certificate.

Steps to extract private key and certificate chain from exported UMS Web Certificate:

- Export UMS Web Certificate Chain as `Export certificate chain to keystore`

- Run Java `keytool`:

```bash linenums="1"
keytool -v -importkeystore -srckeystore yourkeystore.keystore -srcalias ALIAS-NAME -destkeystore myp12file.pfx -deststoretype PKCS12
```

### Find Alias Name in a Keystore

```bash linenums="1"
keytool -list -v -keystore yourkeystore.keystore.jks  | grep -i alias
```

```bash linenums="1"
Alias name: 1264447657_cert
Alias name: 1264447657_key
Alias name: 727194619_cert
Alias name: 727194619_key
```

### Extract Private Key and Certificate Chain from a Keystore

```bash linenums="1"
keytool -v -importkeystore -srckeystore yourkeystore.keystore.jks -srcalias 1264447657_key -destkeystore myp12file.pfx -deststoretype PKCS12
```

```bash linenums="1"
Importing keystore yourkeystore.keystore.jks to myp12file.pfx...
Enter destination keystore password:  
Re-enter new password: 
Enter source keystore password:  
[Storing myp12file.pfx]
```

### Extract Root Certificate from a Keystore

```bash linenums="1"
keytool -exportcert -alias 1264447657_key -keystore yourkeystore.keystore.jks -file ums_cert.crt -rfc
```

```bash linenums="1"
Enter keystore password:  
Certificate stored in file <ums_cert.crt>
```

- View Root Certificate

```bash linenums="1"
openssl x509 -in ums_cert.crt -text -noout
```

```bash linenums="1"
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 1264447657 (0x4b5df0a9)
        Signature Algorithm: sha512WithRSAEncryption
        Issuer: CN = ID--43377-1679588474778-0-0, O = IGEL Technology GmbH, L = Bremen, C = DE
        Validity
            Not Before: Mar 23 16:21:18 2023 GMT
            Not After : Mar 23 16:21:18 2043 GMT
        Subject: CN = ID--43377-1679588474778-0-0, O = IGEL Technology GmbH, L = Bremen, C = DE
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (4096 bit)
                Modulus:
                    00:b7:46:c0:4e:54:bd:9f:3e:b0:4c:e2:62:c1:00:
                    2e:a7:95:54:38:06:0e:be:e0:bc:46:40:c1:f2:23:
                    23:a3:02:5a:7a:0b:6d:48:15:16:32:af:1e:ad:c8:
                    98:4f:34:26:68:8d:da:4b:76:97:d4:bc:78:70:cd:
                    34:b2:f4:b0:39:58:68:09:14:68:80:a6:e6:ef:12:
                    da:61:6e:62:87:67:f4:52:e8:92:5b:19:2f:0a:a1:
                    b7:83:a4:e1:05:5c:3a:6d:da:ca:09:e4:e5:7f:80:
                    a8:a6:3a:f0:06:65:01:a5:38:22:6d:b5:6a:6d:b2:
                    26:d5:f5:42:7d:51:31:79:9e:4c:2d:56:4f:94:e1:
                    9e:0a:52:f0:72:b7:44:bf:6a:4c:9c:0b:b2:86:64:
                    14:60:04:37:7b:c4:54:4b:61:b9:b3:e1:f4:23:d7:
                    77:e9:02:56:bd:3e:b1:0c:30:fc:2b:03:28:31:bd:
                    7e:e8:81:1b:a2:ff:96:69:66:e6:8a:92:31:b1:1e:
                    db:3c:8f:84:50:dc:79:3b:53:33:c9:43:52:e0:c5:
                    ce:48:b0:12:09:5b:73:db:ef:65:47:3f:ed:73:96:
                    70:f6:60:68:1c:91:2a:6f:59:ee:d3:c2:15:d8:d0:
                    ba:b3:86:f5:9e:f5:e2:2b:ad:c9:f1:49:ba:42:62:
                    60:17:16:81:b8:30:60:a4:33:2d:0c:d6:aa:8f:c6:
                    60:3a:53:70:b6:cf:cb:b1:25:14:21:bf:6a:db:ef:
                    e8:4a:da:5e:52:90:bc:7e:bb:69:24:e9:f6:8a:fa:
                    a6:69:7a:10:c9:0f:68:2a:ed:44:32:4a:07:8e:12:
                    4e:cd:a1:b6:34:7e:e5:ab:d1:43:49:9d:05:d6:cd:
                    fd:c1:31:58:c6:3a:a0:20:23:fa:fd:b9:c1:2e:45:
                    e2:07:70:10:e6:09:25:76:92:33:ef:82:13:3c:01:
                    e2:8e:09:62:13:4d:fd:8b:ea:ed:01:1b:88:a7:a8:
                    5a:77:83:1e:8f:fb:0f:af:3a:32:c4:8e:95:af:2f:
                    79:30:1c:46:e3:ae:3e:35:1f:e8:28:da:e5:81:7f:
                    0e:b7:47:ea:c8:05:5d:ab:19:dc:ae:2f:6c:fb:e9:
                    68:9f:9c:97:b9:7d:5b:06:bf:32:5c:0d:d7:c5:7f:
                    35:29:9e:c7:c6:3a:86:5c:50:7d:bf:6f:85:eb:f7:
                    76:c9:a1:a1:e8:f1:32:84:a8:31:c7:b6:eb:82:5d:
                    97:c7:d5:88:a0:35:ab:ff:5a:66:32:e4:5a:65:ed:
                    65:c6:d6:1a:89:06:02:04:9f:60:91:2c:34:59:75:
                    fd:22:36:04:7f:78:6b:02:55:a3:85:46:41:04:b1:
                    95:ce:93
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints: 
                CA:TRUE
    Signature Algorithm: sha512WithRSAEncryption
    Signature Value:
        6b:3f:bb:bc:a8:23:84:74:7c:f9:0d:b7:e4:48:bd:61:fa:30:
        ff:3f:2e:28:0d:e4:e1:ac:14:c9:e4:ba:2d:58:32:b2:b1:a0:
        6a:99:a0:1f:f9:57:57:29:fa:b5:23:8c:fb:b0:cc:fc:94:e1:
        b7:07:a6:b7:44:dc:54:ba:4f:15:72:c5:2f:65:1e:cf:14:82:
        78:50:88:a7:9a:5a:c5:48:cc:c1:bc:60:28:42:f0:0c:4f:30:
        32:75:08:a9:d1:18:57:65:79:3a:ce:fa:f2:f6:4b:1f:15:95:
        19:59:d3:bc:50:48:0c:65:ab:11:c3:37:6c:9a:f8:57:9c:82:
        85:d9:6a:36:d1:03:fa:7d:19:03:db:1a:82:b5:3b:87:fc:97:
        c7:78:ec:31:03:3d:fe:49:bd:17:0c:14:35:4e:61:d1:64:ce:
        66:1a:e0:58:37:ad:b5:aa:c7:ac:fa:93:23:9c:1f:d4:d5:5b:
        63:64:06:08:c7:d4:54:5a:f3:5e:12:56:ce:cf:31:59:93:6d:
        71:4a:0e:c6:f8:9d:18:0d:5f:91:0d:62:e3:41:21:11:7b:5c:
        16:f8:6d:8b:48:9c:e9:f1:9e:9b:dc:33:31:b4:61:77:2c:05:
        ca:9f:d6:36:f2:dd:39:2e:86:86:12:0c:37:67:92:e3:18:6e:
        60:6d:ae:9c:4a:9c:91:93:40:df:81:5b:f6:33:34:31:1c:85:
        54:79:d0:9d:f2:2d:d8:7e:cd:ad:f7:2d:6a:a1:7b:56:6b:09:
        aa:47:c0:21:71:f6:8d:5f:a1:ce:06:42:7b:b3:56:c8:8c:ce:
        ec:a3:99:78:0a:88:e3:87:e9:7a:3d:9b:0c:3b:6d:ec:c1:f7:
        59:d2:c0:71:5a:4a:e8:cc:7d:ab:00:66:40:d7:93:cf:f1:7b:
        e3:23:37:6a:78:74:1a:a1:37:33:96:6d:bd:94:64:31:22:17:
        d0:e3:8f:fe:45:74:83:ac:f4:4b:d9:ee:97:3b:fe:1d:96:cf:
        98:91:25:53:d0:c6:b8:e3:ac:f8:70:ba:c9:fe:aa:37:5b:41:
        39:d5:82:82:8c:21:f6:d7:26:42:9b:f6:ca:76:69:2b:2c:38:
        6f:e5:bb:9d:1d:d8:47:bb:9e:31:99:bd:aa:7e:6a:82:3d:82:
        f4:f2:97:c2:56:e1:7d:09:e0:d0:e9:eb:ca:e7:06:8b:f8:67:
        68:4f:b8:df:5b:06:4f:98:15:21:06:b5:66:d3:8f:3c:ef:8b:
        2d:98:16:59:7e:bf:56:db:6e:70:e3:5e:84:9d:dd:13:92:cd:
        73:b2:7a:00:37:06:e4:51:73:d8:9e:e0:b7:b7:d5:ed:5d:c5:
        ef:73:f2:eb:bb:00:b2:cb
```

-----

-----

## Troubleshooting Certificates

**NOTE:** [The Most Common OpenSSL Commands](https://www.sslshopper.com/article-most-common-openssl-commands.html)

### Command Line Tools

- Curl – a powerful command line tool for sending or transferring data to a server. When using curl in combination with HTTPS, you can see the TLS handshake in real time.
    - Useful example: `curl –vvI https://icg.domain.com:8443`
- Openssl – the Swiss Army Knife of certificate/SSL/TLS troubleshooting.
    - Check a certificate: `openssl x509 -in certificate.crt –noout -text`
    - Check an SSL Connection: `openssl s_client -connect www.paypal.com:443`
    - Extract key/cert from pfx: 
        - `openssl pkcs12 -in [yourfile.pfx] -nocerts -out [privatekey.key]`
        - `openssl pkcs12 -in [yourfile.pfx] -clcerts -nokeys -out [drlive.crt]`
        - `openssl rsa -in [privatekey.key] -out [privatekey-decrypted.key]`

### GUI Tools

- When troubleshooting SSL/certificate issues involving the ICG or UMS Web Certificate, always ask for uncropped screenshots of `Certificate Management > Web and Cloud Gateway`
- What about the Device Communication (tckey) certificate? The simple answer is ‘do not touch’ 
- The browser is a great GUI troubleshooting tool, but don’t forget that the browser may ‘complete’ the chain and show everything as good where the OpenSSL libraries or other programs may be more picky! 

-----

## Links and Resources

- [A Primer on ECC Cryptography](https://blog.cloudflare.com/a-relatively-easy-to-understand-primer-on-elliptic-curve-cryptography)
- [OpenSSL Reference](https://www.sslshopper.com/article-most-common-openssl-commands.html)
- [IGEL Community LetsEncrypt/Certbot tutorial](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-ICG-Free-Signed-Certificate/?h=)
- [Building an AD CS Server in Your Lab](https://virtuallythere.blog/2018/04/24/making-things-a-bit-more-secure-part-1/)
- [KB: Configure the UMS to Integrate Reverse Proxy with SSL Offloading](https://kb.igel.com/en/universal-management-suite/current/configure-the-ums-to-integrate-reverse-proxy-with-)
- [KB: Upload and Assign Files in the IGEL UMS Web App](https://kb.igel.com/en/universal-management-suite/current/upload-and-assign-files-in-the-igel-ums-web-app)

-----

## Starting with UMS 12.04 - Improvements for Certificate Import

Starting with UMS 12.04, certificate management now adds sanity check to the imported chains:

- Make sure chain is complete
- Required private keys are present
- Leaves need to have valid `subject alternative names`

Will now allow the import of `jks` and `pkcs12` key stores and builds chain automatically:

- Highlight missing elements in the imported result (e.g. private keys)
- Add missing root certificates from the java trust store, if available

Can now manage certificates via the command line:

- Set chain of web certificates
- Automate process of UMS installation
- Add certificates, keypairs, or complete keystores
- Remove existing certificates, web certificates, and key stores from the database

-----

## IGEL KB - Using AI Tool

**Q:** IGEL KB: AI query

```bash linenums="1"
How to add public certificate to UMS?
```

**A:** IGEL KB: AI query response

![10](Images/HOWTO-Certificates-10.png)

-----

## Create a List of Certificates on IGEL OS and include End Date

```bash linenums="1"
#!/bin/bash
 
# Find end date on certificates
 
cd /etc
find . -type f \( -name "*.cer" -o -name "*.crt" -o -name "*.pem" \) -exec echo "FILE NAME: ==> " {} \; -exec openssl x509 -enddate -noout -in {} \;
```

-----

## Validate Certificate Chains Supplied by the UMS Server

 ```bash linenums="1"
 echo "" | openssl s_client -showcerts UMS-SERVER-FQDN:8443 | openssl crl2pkcs7 -nocrl -certfile /dev/stdin | openssl pkcs7 -noout -print_certs -text
 ```

 -----

 -----

## Hybrid SAN (external + internal) Example

How to create a certificate / key pair that ensures the certificate contains a valid subject name matching the server’s IP address, or the server’s hostname, or a Subject Alternative Name (SAN) listing multiple IPs or hostnames?

1) Create server.cnf

```ini
# server.cnf
[ req ]
default_bits       = 2048
distinguished_name = req_dn
req_extensions     = v3_req
prompt             = no

[ req_dn ]
C  = US
ST = CA
L  = San Francisco
O  = Example Corp
OU = Production
CN = prod-web.example.com        # Primary name (CN)

[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[ alt_names ]
# External hostnames
DNS.1 = prod-web.example.com
DNS.2 = api.example.com

# Internal hostnames
DNS.3 = web.internal.lan

# External public IP
IP.1  = 203.0.113.25

# Internal IPs
IP.2  = 10.0.0.5
IP.3  = 192.168.1.10
```

2) Generate key + CSR

```bash linenums="1"
# RSA (common)
openssl genrsa -out server.key 2048

# Create CSR with SANs from server.cnf
openssl req -new -key server.key -out server.csr -config server.cnf
```

3) Get a cert

  - A) Self-signed (testing/dev)

```bash linenums="1"
openssl x509 -req -in server.csr -signkey server.key \
  -out server.crt -days 365 -extensions v3_req -extfile server.cnf
```

  - B) Signed by your internal CA

```bash linenums="1"
# Assuming you have ca.crt / ca.key
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial \
  -out server.crt -days 398 -extensions v3_req -extfile server.cnf
```


**NOTE:** (For public CAs, submit `server.csr` to the CA. They’ll embed the SANs from the CSR.)

4) Verify SANs & subject

```bash linenums="1"
openssl x509 -in server.crt -noout -text | grep -A1 "Subject:"
openssl x509 -in server.crt -noout -text | sed -n '/Subject Alternative Name/,+1p'
```

**NOTE:** You should see:

  - `Subject: CN=prod-web.example.com`

  - `X509v3 Subject Alternative Name: with DNS:prod-web.example.com, DNS:api.example.com, DNS:web.internal.lan, IP Address:203.0.113.25, IP Address:10.0.0.5, IP Address:192.168.1.10.`

- One-liner (OpenSSL ≥ 1.1.1), no config file

```bash linenums="1"
openssl req -new -x509 -nodes -days 365 \
  -out server.crt -keyout server.key \
  -subj "/C=US/ST=CA/L=San Francisco/O=Example Corp/OU=Production/CN=prod-web.example.com" \
  -addext "basicConstraints=CA:FALSE" \
  -addext "keyUsage=digitalSignature,keyEncipherment" \
  -addext "extendedKeyUsage=serverAuth" \
  -addext "subjectAltName=DNS:prod-web.example.com,DNS:api.example.com,DNS:web.internal.lan,IP:203.0.113.25,IP:10.0.0.5,IP:192.168.1.10"
```