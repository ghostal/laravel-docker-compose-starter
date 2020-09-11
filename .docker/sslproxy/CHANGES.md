Original code from https://github.com/bombbomb/docker-ssl-proxy/

When used as part of docker-compose the `build.sh` and `run.sh` scripts
aren't needed. Made some changes to `add_self_signed_certificates.sh`
in order to have Chrome accept and trust the self-signed certificate.

## Get Chrome To Accept And Trust The Cert

1. Right click on the address bar icon and view the certificate, or `Developer Tools > Security > View Certificate`.
2. Go to `Details > Export` and save as `PKCS #7` format.
3. Go to `(Chrome) Settings > Advanced > Privacy and security > Manage Certificates > Authorities` and click `Import`.
4. Browse to the certificate exported in a previous step.
5. Check all the boxes and click `OK`.
6. You may need to navigate to the page and go to `Developer Tools > Application > Clear storage` to have the certificate details reloaded.

## Expired Certificate

If Docker rebuilds from the cache, you'll get the previous certificate. You can
bust the cache by setting different stuff in `add_self_signed_certs.sh`. There's
probably a neater way to do this using environment variables in the Dockerfile
or something.

## Helpful information
https://stackoverflow.com/questions/7580508/getting-chrome-to-accept-self-signed-localhost-certificate
https://stackoverflow.com/questions/44145936/chrome-active-content-with-certificate-errors
https://security.stackexchange.com/questions/74345/provide-subjectaltname-to-openssl-directly-on-command-line
```
man openssl
man req
man x509
```