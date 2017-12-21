## Key and Certificate Management
- Key algorithm
  - for web server keys everyone uses RSA
  - For SSH, DSA and RSA are widely used
- Key size
  - Today, 2,048-bit RSA keys are considered secure
  - Aim also to use 2,048 bits for DSA keys and at least 256 bits for ECDSA
- Passphrase
  - strongly recommended
  - Protected keys can be safely stored, transported, and backed up
  - but either too inconvenient or has unacceptable availability implications
  - using protected keys in production does not actually increase the security much
    - because, once activated, private keys are kept unprotected in program memory; an attacker who can get to the server can get the keys
   - Thus, passphrases should be viewed only as a mechanism for protecting private keys when they are not installed on production systems.
- To generate an RSA key, use the genrsa command
  - it’s best to stay away from the other algorithms(DES, 3DES, and SEED)
  - Private keys are stored in the so-called PEM format
## Creating CSRs
- if you want a field to be empty, you must enter a single dot (.) on the line, rather than just
hit Return. If you do the latter, OpenSSL will populate the corresponding CSR field with the
default value.
  - For some fields there will be a default value, If you enter '.', the field will be left blank.
  - Having a challenge password does not increase the security of the CSR in any way. Further, this field
should not be confused with the key passphrase, which is a separate feature.
- Unless you’re using some form of public key pinning and wish to continue using the existing key, it’s best practice to generate a new key every time you apply for a new certificate. Key generation is quick and inexpensive and reduces your exposure.
## Creating Certificates Valid for Multiple Hostnames
- There are two mechanisms for supporting multiple hostnames in a certificate. The first is to list all desired hostnames using an X.509 extension called Subject Alternative Name (SAN). The second is to use wildcards. You can also use a combination of the two approaches when it’s more convenient. In practice, for most sites, you can specify a bare domain name and a wildcard to cover all the subdomains (e.g., feistyduck.com and *.feistyduck.com).

## Examining Certificates
- the address of the CA’s Online Certificate Status Protocol (OCSP) responder, which can be used to check for certificate revocation in real time.


## When checking certificates validation that are made by private CA
- Clear browser history to delete old site certificates
- Add(or remove and add) the CA bundle to make the validation succeed

## Extended Key Usage
- This extensions consists of a list of usages indicating purposes for which the certificate public key can be used.

## AIA(Authority Information Access) extention
- AIA extension allows SSL/TLS clients (mostly web browsers) to go get the missing intermediate certificates, not presented by the server.
- Servers that do not send the entire chain are in breach of the SSL/TLS standard.
- Certificates are validated in order as a chain as follow.
  - Site certificate -> Intermediate CA certificates -> Root CA certificate
- Also contains OCSP URI
- https://www.tbs-certificates.co.uk/FAQ/en/453.html

## CRL, OCSP and OCSP stapling
- For TLS client, OCSP stapling is better than OCSP which is better than CRL.
- https://www.fir3net.com/Security/Concepts-and-Terminology/certificate-revocation.html
- Enabling OCSP stapling is not normal. Most of well-known WEB services do not enable it.
- https://arstechnica.com/information-technology/2017/07/https-certificate-revocation-is-broken-and-its-time-for-some-new-tools/

## Reference
- https://help.ubuntu.com/lts/serverguide/certificates-and-security.html
- https://pki-tutorial.readthedocs.io/en/latest/
- https://isidore.co/calibre/get/pdf/5583
  - https://modsecurity.org/
  - https://www.ssllabs.com/
  - https://lira.epac.to/DOCS-TECH/Security/Apache%20Security.pdf
  - https://www.qualys.com/
  - CA Certificates(Known CA public keys)
    - https://hg.mozilla.org/mozilla-central/raw-file/tip/security/nss/lib/ckfw/builtins/certdata.txt
    - https://curl.haxx.se/docs/caextract.html
- https://www.feistyduck.com/books/bulletproof-ssl-and-tls/bulletproof-ssl-and-tls-introduction.pdf
- Difference between SSL and TLS
  - http://www.hostingadvice.com/how-to/tls-vs-ssl/
    - "although the HTTP/2 standard itself does not require the use of encryption, most client implementations (Firefox, Chrome, Safari, Opera, IE, Edge) have said they will only support HTTP/2 over TLS, which makes encryption de facto mandatory."
- https://www.openssl.org/docs
  - https://www.openssl.org/docs/manmaster/man1/req.html
  - https://www.openssl.org/docs/manmaster/man1/ca.html
  - https://www.openssl.org/docs/manmaster/man1/x509.html
  - https://www.openssl.org/docs/manmaster/man5/x509v3_config.html
- Cryptography of SSH
  - https://www.mnin.org/write/2006_sshcrypto.html

## Browsers
- Google Chrome
  - Chrome seems to use their own way called 'CRLsets' that pushes sets of revocation list contributed by CAs
    - https://scotthelme.co.uk/certificate-revocation-google-chrome/
    - https://www.imperialviolet.org/2012/02/05/crlsets.html
- Firefox
  - Firefox does not work with OCSP stapling emitting "SEC_ERROR_OCSP_BAD_SIGNATURE"
  - With OCSP responder, it works fine
  - https://wiki.mozilla.org/CA:ImprovingRevocation

## Other solutions
- http://pki.fedoraproject.org/wiki/PKI_Main_Page
  - Called 'Dogtag'
  - Mainly written in Java
  - Utilize 389-ds(Directory Service) as its storage
  - Seems mostly available on Redhat Linux
  - Being considered as secret store by Barbican which is one of Openstack projects
    - https://developer.openstack.org/api-guide/key-manager/dogtag_setup.html
- https://www.ejbca.org/
- https://www.openca.org/
  - Seems mostly available on Redhat Linux
