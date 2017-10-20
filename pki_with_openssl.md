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
