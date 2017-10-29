
## Setting up your CI/CD infrastructure
### Setting up Stage and Prod environments

We are going to set up "stage" (UAT) and "prod" environments,
which jobs in our CI/CD pipeline can then target.

We'll put Stage and Prod on the same server, for expediency for the tutorial.

---
## Setting up your CI/CD infrastructure
### Setting up Stage and Prod environments
#### Web server

Install Apache2 and change the port to 8008 (since GitLab is listening on 80).

```bash
sudo apt-get update; \
sudo apt install -y apache2 php libapache2-mod-php; \
sudo sed -i /etc/apache2/ports.conf -e 's:Listen 80:Listen 8008:'; \
sudo service apache2 start; \
curl http://localhost:8008/

```
You should see the Ubuntu Apache welcome page.
---
## Setting up your CI/CD infrastructure
### Setting up Stage and Prod environments
#### DNS

Add "stage.example.com" and "prod.example.com" to the `localhost` record in `/etc/hosts` so we can test the vhosts from our lab Linux server.

Example:

```console
sudo sed -e 's:^127.0.0.1.*:127.0.0.1 localhost stage.example.com prod.example.com' -i /etc/hosts
```
--- 
## Setting up your CI/CD infrastructure 
### Set up Stage 
### Document root

```bash
sudo mkdir /var/www/stg-html
echo "<?php echo '<p>Stage - Hello World</p>'; ?>" | sudo tee /var/www/stg-html/index.php
```

--- 
## Setting up your CI/CD infrastructure 
### Set up Stage 
### Create httpd vhost config

Set up httpd config for the "stage" virtual host:

```bash
cat <<EOF | sudo tee /etc/apache2/sites-available/001-stg.conf
<VirtualHost *:8008>
        ServerName stage.example.com
        DocumentRoot /var/www/stg-html
        ErrorLog ${APACHE_LOG_DIR}/stg.error.log
        CustomLog ${APACHE_LOG_DIR}/stg.access.log combined
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF
```
--- 
## Setting up your CI/CD infrastructure 
### Set up Stage 
### Load httpd vhost config

Enable vhost:

```bash
sudo ln -s /etc/apache2/sites-available/001-stg.conf /etc/apache2/sites-enabled/
sudo service apache2 reload
```

--- 
## Setting up your CI/CD infrastructure 
### Set up Stage 
### Test httpd vhost config
Test it, it should say `<p>Stage - Hello World</p>`.

```bash
curl http://stage.example.com:8008/
```
Example:

```shell_session
root@ip-172-31-27-145:~# curl http://stage.example.com:8008/
<p>Stage - Hello World</p>root@ip-172-31-27-145:~#
root@ip-172-31-27-145:~#
```
---

## Setting up your CI/CD infrastructure 
### Set up Prod 
### Document root

```bash
sudo mkdir /var/www/prod-html
echo "<?php echo '<p>Prod - Hello World</p>'; ?>" | sudo tee /var/www/prod-html/index.php

```
--- 
## Setting up your CI/CD infrastructure 
### Set up Prod 
### Create httpd vhost config

```bash
cat <<EOF | sudo tee /etc/apache2/sites-available/002-prod.conf
<VirtualHost *:8008>
        ServerName prod.example.com
        DocumentRoot /var/www/prod-html
        ErrorLog ${APACHE_LOG_DIR}/prod.error.log
        CustomLog ${APACHE_LOG_DIR}/prod.access.log combined
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF
```

--- 
## Setting up your CI/CD infrastructure 
### Set up Prod 
### Load httpd vhost config

Enable and activate the new site:

```bash
sudo ln -s /etc/apache2/sites-available/002-prod.conf /etc/apache2/sites-enabled/
sudo service apache2 reload
```

--- 
## Setting up your CI/CD infrastructure 
### Set up Prod 
### Test httpd vhost config

Test it:
```bash
curl http://prod.example.com:8008/
```
You should see `<p>Prod - Hello World</p>`.
