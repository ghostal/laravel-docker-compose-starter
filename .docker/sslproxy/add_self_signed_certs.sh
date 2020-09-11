mkdir /etc/nginx/certs/
cd /etc/nginx/certs/
cp /etc/ssl/openssl.cnf /tmp/openssl_modified.cnf
printf "[SAN]\nbasicConstraints = CA:TRUE\nsubjectAltName=DNS:localhost,DNS:localhost" >> /tmp/openssl_modified.cnf
openssl genrsa -out key.pem 2048
openssl req -new -sha256 -key key.pem -nodes -subj "/C=UK/ST=Herts/L=St Albans/O=ghostaldev/CN=localhost" \
	-reqexts SAN -extensions SAN -config /tmp/openssl_modified.cnf \
	-out csr.pem
openssl x509 \
	-extfile /tmp/openssl_modified.cnf -extensions SAN \
	-req -in csr.pem -signkey key.pem -out cert.pem
