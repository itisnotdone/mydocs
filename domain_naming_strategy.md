# Domain Naming Strategy
- Buy an official and external domain from a DNS hosting service such as
  - blahblah.com
- Define internal domains using subdomains derived from the external domain, blahblah.com, such as
  - dev.blahblah.com
  - stage.blahblah.com
  - intra.blahblah.com
  - why should we use subdomains?
    - https://www.pluralsight.com/blog/software-development/choose-internal-top-level-domain-name
    - https://social.technet.microsoft.com/wiki/contents/articles/34981.active-directory-best-practices-for-internal-domain-and-network-names.aspx
- Buy a certificate for SSL/TLS communication with a CSR that specifies all those defined domains as SAN(Subject Alt Name)s for example,
  - CN=blahblah.com
  - SAN=
    - blahblah.com
    - *.blahblah.com
    - *.dev.blahblah.com
    - *.stage.blahblah.com
    - *.intra.blahblah.com
  - This way, you can save costs 
  - to buy many certificates 
  - to manage and deploy site and CA certificates for servers and clients.
- Setup DNS servers separately for internal and external domains
  - The internal DNS has to be acceable only by internal clients and hosts


## Reference
https://stackoverflow.com/questions/5935369/ssl-how-do-common-names-cn-and-subject-alternative-names-san-work-together
- RFC 5280, section 4.1.2.6 says "The subject name MAY be carried in the subject field and/or the subjectAltName extension". This means that the domain name must be checked against both SubjectAltName extension and Subject property (namely it's common name parameter) of the certificate. These two places complement each other, and not duplicate it. And SubjectAltName is a proper place to put additional names, such as www.domain.com or www2.domain.com
- as per RFC 6125, published in '2011 the validator must check SAN first, and if SAN exists, then CN should not be checked. Note, that the RFC 6125 is relatively recent and there still exist certificates and CAs that issue certificates, which include the "main" domain name in CN and alternative domain names in SAN. I.e. by excluding CN from validation if SAN is present, you can deny some otherwise valid certificate.
- To be absolutely correct you should put all the names into the SAN field. The CN field should contain a Subject Name not a domain name, but when the Netscape found out this SSL thing, they missed to define its greatest market. Simply there was not certificate field defined for the Server URL. This was solved to put the domain into the CN field, and nowadays usage of the CN field is deprecated, but still widely used. The CN can hold only one domain name. The general rules for this: 
  - CN: put here your main URL (for compatibility)
  - SAN: put all your domain here, repeat the CN because its not in right place there, but its used for that...

