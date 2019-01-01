docker-postfix-smtp
==============

Run postfix with smtp authentication (sasldb) in a docker container.
TLS and OpenDKIM support are included.

## Installation


1. Clone the codes  
	
	```bash
	git clone https://github.com/a-lang/docker-postfix-smtp.git
	```

2. Pull the image  

	```bash
	docker pull alangtw/postfix-smtp:trusty
	```

## Usage
1. Run the container
  
	```bash
	./run.sh
	```
2. Create the SSL self-signed certificates for your domain, save the certificates `.key and .crt` in `data/certs`
	
	```bash
	docker exec -it postfix openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
	-keyout  /etc/postfix/certs/smtp-mydomain-com.key \
	-out /etc/postfix/certs/smtp-mydomain-com.crt
	```
3. Create DKIM key, save your domain key ```.private``` in ```data/domainkeys```

	```bash
	docker exec -it postfix sh -c "cd /etc/opendkim/domainkeys && opendkim-genkey -t -s mail -d mydomain.com"
	```
4. Stop the container then re-start it
	
	```bash
	./stop.sh
	./run.sh
	```

## Note
+ SMTP login credential should be set to (`username@mydomain.com`, `password`) in Smtp Client
+ You also need to modify the DNS setting for TXT records with SPF, DKIM and DMARC info.

## Reference
+ [Postfix SASL Howto](http://www.postfix.org/SASL_README.html)
+ [How To Install and Configure DKIM with Postfix on Debian Wheezy](https://www.digitalocean.com/community/articles/how-to-install-and-configure-dkim-with-postfix-on-debian-wheezy)