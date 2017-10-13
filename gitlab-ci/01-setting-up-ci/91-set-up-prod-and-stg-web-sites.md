# Set up deployment targets: "stage" and "prod"

We are going to set up mock "stage" and "prod" environments,
so that our CI/CD pipeline has environments to deploy into.

We'll put them on the same server, to keep the
infrastructure footprint manageable for the tutorial.


## Bring up a Web server alongside GitLab

Install Apache2, listening on port 8008 (since GitLab is listening on 80).

```bash
sudo apt-get update
sudo apt install -y apache2 php libapache2-mod-php
sudo sed -i /etc/apache2/ports.conf -e 's:Listen 80:Listen 8008:'
sudo service apache2 start
sudo service apache2 status # the service should be active and running
curl http://localhost:8008/  # you should see the Ubuntu Apache Welcome page source

```

Set up "stage" and "prod" virtual hosts (two separate environments).

## Set up /etc/hosts record

Add "stage.example.com" and "prod.example.com" to the localhost record in /etc/hosts -- we'll be able to test from the server itself.

Example:

```
127.0.0.1 localhost stage.example.com prod.example.com
```

## Set up stage

### Set up document root

```bash
mkdir /var/www/stg-html
echo "<?php echo '<p>Stage - Hello World</p>'; ?>" > /var/www/stg-html/index.php
```

### Set up vhost

Set up httpd config for the "stage" virtual host:

```bash
cat <<EOF > /etc/apache2/sites-available/001-stg.conf
<VirtualHost *:8008>
        ServerName stage.example.com
        DocumentRoot /var/www/stg-html
        ErrorLog ${APACHE_LOG_DIR}/stg.error.log
        CustomLog ${APACHE_LOG_DIR}/stg.access.log combined
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF
```

Enable vhost:

```bash
ln -s /etc/apache2/sites-available/001-stg.conf /etc/apache2/sites-enabled/
service apache2 reload
```

Test it, it should say `<p>Stage - Hello World</p>`.

```bash
curl http://stage.example.com:8008/
```
Example:

```shell_session
root@ip-172-31-27-145:~# curl http://stage.example.com:8008/
<p>Stage - Hello World</p>root@ip-172-31-27-145:~#
```

## Set up Prod

### Set up document root

```bash
mkdir /var/www/prod-html
echo "<?php echo '<p>Prod - Hello World</p>'; ?>" > /var/www/prod-html/index.php

```
### Set up vhost

Set up httpd config for the "prod" virtual host:

```bash
cat <<EOF > /etc/apache2/sites-available/002-prod.conf
<VirtualHost *:8008>
        ServerName prod.example.com
        DocumentRoot /var/www/prod-html
        ErrorLog ${APACHE_LOG_DIR}/prod.error.log
        CustomLog ${APACHE_LOG_DIR}/prod.access.log combined
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF
```

Enable and activate the new site:

```bash
ln -s /etc/apache2/sites-available/002-prod.conf /etc/apache2/sites-enabled/
service apache2 reload
```

Test it, it should say `<p>Prod - Hello World</p>`:

```bash
curl http://prod.example.com:8008/
```

# [[Up]](README.md)
