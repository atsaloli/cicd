# Set up deployment targets: stage and prod web sites

We are going mock up stage and prod environments on the same server.

Install Apache2, listening on port 8008 (since GitLab is listening on 80).

```
apt install apache2
sed -i /etc/apache2/ports.conf -e 's:Listen 80:Listen 8008:'
service apache2 start
service apache2 status # the service should be active and running
apt install lynx # install web browser
lynx http://alpha.gitlabtutorial.org:8008/  # you should see the Welcome page

```

Set up "stage" and "prod" virtual hosts to simulate separate environments.

## Set up stage:

```
mkdir /var/www/stg-html
echo 'stage' > /var/www/stg-html/index.html
```

Edit /etc/hosts to add "stage.example.com" as an alias to our public DNS name, e.g.: `8.19.33.153 alpha.gitlabtutorial.org stage.example.com`

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

Enable the new site:

```
ln -s /etc/apache2/sites-available/001-stg.conf /etc/apache2/sites-enabled/
service apache2 reload
```

Test it, it should say "stage": `lynx http://stage.example.com:8008/`


## Set up prod:

```
mkdir /var/www/prod-html
echo 'prod' > /var/www/prod-html/index.html

```

Edit /etc/hosts to add "stage.example.com" as an alias to our public DNS name, e.g.: `8.19.33.153 alpha.gitlabtutorial.org stage.example.com prod.example.com`

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
```
ln -s /etc/apache2/sites-available/002-prod.conf /etc/apache2/sites-enabled/
service apache2 reload
```

Test it, it should say "prod": `lynx http://prod.example.com:8008/`



Now add PHP:

```bash
apt install -y apache2-php php libapache2-mod-php
service apache2 restart
echo "<?php echo '<p>Stage - Hello World</p>'; ?>" > /var/www/stg-html/test.php
echo "<?php echo '<p>Prod - Hello World</p>'; ?>" > /var/www/prod-html/test.php
lynx http://stage.example.com:8008/test.php
lynx http://prod.example.com:8008/test.php
```
