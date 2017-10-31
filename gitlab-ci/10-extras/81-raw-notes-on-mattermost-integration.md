# Raw notes on GitLab/Mattermost integration

- GitLab comes up with http:// out of the box, no https://



## Enabling HTTPS on Mattermost

Reference: https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04

As per section "Running GitLab Mattermost with HTTPS" of https://docs.gitlab.com/omnibus/gitlab-mattermost/
let's place an SSL certificate and certificate key inside /etc/gitlab/ssl:


``` 
root@37ee111c-e115-487b-8b2c-aca1044cca18:/etc/gitlab# mkdir ssl
root@37ee111c-e115-487b-8b2c-aca1044cca18:/etc/gitlab# sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/gitlab/ssl/nginx-selfsigned.key -out /etc/g
itlab/ssl/nginx-selfsigned.crt
Generating a 2048 bit RSA private key
........................................................................................................+++
................+++
writing new private key to '/etc/gitlab/ssl/nginx-selfsigned.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:California
Locality Name (eg, city) []:Burbank
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Vertical Sysadmin, Inc.
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:mattermost.example.com
Email Address []:nobody@example.com
root@37ee111c-e115-487b-8b2c-aca1044cca18:/etc/gitlab#
```

Then edit gitlab.rb and reconfigure gitlab (per above-referenced "Running GitLab Mattermost with HTTPS").

We can now access Mattermost through https://mattermost.example.com/

## Enable incoming webhooks

Per "GitLab notifications in Mattermost" in "Administering GitLab Mattermost" in https://docs.gitlab.com/omnibus/gitlab-mattermost/, set
mattermost['service_enable_incoming_webhooks'] = true
and reconfigure GitLab.

## enable outgoing webhooks
in gitlab.rb
mattermost['service_enable_outgoing_webhooks'] = true

## tell mattermost to trust our GitLab self-signed cert

Set "Enable Insecure Outgoing Connections" to true in Mattermost -> System Console -> Settings -> Security -> Connections

# enable commands (like /issue create add a logo)
mattermost['service_enable_commands'] = true


## add an incoming webhook in Mattermost

settings -> Integrations -> Incoming Webhooks -> Add

This will give you a URL you can put into GitLab (under project settings -> webhooks)


## troubleshooting GitLab
The GitLab -> Mattermost integration did not work -- I would get HTTP 500 errors when testing the integration.

Edit /etc/gitlab/gitlab.rb to crank up "level" of logging on every line that would let me,
from INFO to DEBUG, and then used the following to find the relevant log file:
```
cd /var/log/gitlab ; multitail -i mattermost/current mattermost/mattermost.log  gitlab-workhorse/current    $l/gitlab-rails/production.log
```

The clue was in production.log:

```
Started GET "/root/example/services/slack/test" for 172.250.2.233 at 2016-11-06 22:14:02 +0000
Processing by Projects::ServicesController#test as HTML
  Parameters: {"namespace_id"=>"root", "project_id"=>"example", "id"=>"slack"}
Completed 500 Internal Server Error in 62ms (ActiveRecord: 5.1ms)

OpenSSL::SSL::SSLError (SSL_connect returned=1 errno=0 state=error: certificate verify failed):
  app/models/project_services/slack_service.rb:79:in `execute'
  app/models/service.rb:115:in `test'
  app/controllers/projects/services_controller.rb:33:in `test'
  lib/gitlab/request_profiler/middleware.rb:15:in `call'
  lib/gitlab/middleware/go.rb:16:in `call'
```

This is even with SSL Verification turned off!  OK, fine, whatever.

I changed matternmost external URL in gitlab.rb from https to http; and commented
out the three mattermost nginx settings I had changed earlier:

```
#mattermost_nginx['redirect_http_to_https'] = true
#mattermost_nginx['ssl_certificate'] = "/etc/gitlab/ssl/nginx-selfsigned.crt"
#mattermost_nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/nginx-selfsigned.key"
```
But I couldn't log back into Mattermost web UI.  
I ended up doing a wipe and reinstall of Gitlab-ce package:

```
sudo gitlab-ctl stop
dpkg -r gitlab-ce
rm -rf /etc/gitlab/ /opt/gitlab/ /var/log/gitlab/ /var/opt/gitlab/
```


After re-install:
- configure external URLs for gitlab and mattermost,
- enable and configure mattermost

in gitlab.rb:

```
commit 0a7b279eb886cd1d30f655faa19d577bc3a2cc04
Author: Aleksey Tsalolikhin <aleksey@verticalsysadmin.com>
Date:   Sun Nov 6 22:55:47 2016 +0000

    enable mattermost chat

diff --git a/gitlab.rb b/gitlab.rb
index 682e98f..abcfc8e 100644
--- a/gitlab.rb
+++ b/gitlab.rb
@@ -8,7 +8,7 @@
 ## Url on which GitLab will be reachable.
 ## For more details on configuring external_url see:
 ## https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/settings/configuration.md#configuring-the-external-url-for-gitlab
-external_url 'http://localhost'
+external_url 'http://gitlab.example.com'


 ## Note: configuration settings below are optional.
@@ -729,9 +729,8 @@ external_url 'http://localhost'
 # GitLab Mattermost #
 #####################

-# mattermost_external_url 'http://mattermost.example.com'
-#
-# mattermost['enable'] = false
+mattermost_external_url 'http://mattermost.example.com'
+mattermost['enable'] = true
 # mattermost['username'] = 'mattermost'
 # mattermost['group'] = 'mattermost'
 # mattermost['uid'] = nil
@@ -747,15 +746,15 @@ external_url 'http://localhost'
 # mattermost['service_maximum_login_attempts'] = 10
 # mattermost['service_segment_developer_key'] = nil
 # mattermost['service_google_developer_key'] = nil
-# mattermost['service_enable_incoming_webhooks'] = true
+mattermost['service_enable_incoming_webhooks'] = true
 # mattermost['service_enable_post_username_override'] = false
 # mattermost['service_enable_post_icon_override'] = false
 # mattermost['service_enable_testing'] = false
 # mattermost['service_enable_security_fix_alert'] = true
 # mattermost['service_enable_insecure_outgoing_connections'] = false
 # mattermost['service_allow_cors_from'] = ""
-# mattermost['service_enable_outgoing_webhooks'] = true
-# mattermost['service_enable_commands'] = false
+mattermost['service_enable_outgoing_webhooks'] = true
+mattermost['service_enable_commands'] = true
 # mattermost['service_enable_only_admin_integrations'] = true
 # mattermost['service_enable_oauth_service_provider'] = false
 # mattermost['service_enable_developer'] = false
@@ -791,13 +790,13 @@ external_url 'http://localhost'
 # mattermost['log_file_format'] = nil
 # mattermost['log_enable_diagnostics'] = true

-# mattermost['gitlab_enable'] = false
-# mattermost['gitlab_id'] = "12345656"
-# mattermost['gitlab_secret'] = "123456789"
-# mattermost['gitlab_scope'] = ""
-# mattermost['gitlab_auth_endpoint'] = "http://gitlab.example.com/oauth/authorize"
-# mattermost['gitlab_token_endpoint'] = "http://gitlab.example.com/oauth/token"
-# mattermost['gitlab_user_api_endpoint'] = "http://gitlab.example.com/api/v3/user"
+mattermost['gitlab_enable'] = true
+mattermost['gitlab_id'] = "1ad79d8cbd3dee20ed3a6e95af8c69ac690c35fcf482eca2ba0390a66dcf4c58"
+mattermost['gitlab_secret'] = "a42ec81cb707a0768e578dc878497681917809a0e521c953cca5bc5989455589"
+mattermost['gitlab_scope'] = ""
+mattermost['gitlab_auth_endpoint'] = "http://gitlab.example.com/oauth/authorize"
+mattermost['gitlab_token_endpoint'] = "http://gitlab.example.com/oauth/token"
+mattermost['gitlab_user_api_endpoint'] = "http://gitlab.example.com/api/v3/user"

 # mattermost['aws'] = {'S3AccessKeyId' => '123', 'S3SecretAccessKey' => '123', 'S3Bucket' => 'aa', 'S3Region' => 'bb'}
```

Login to mattermost which will take you through GitLab SSO where you'll have to
authorize Mattermost as an application.

Also, you have to add Mattermost as an application first, as per hte GitLab
docs mentioned in my WP blog.

Then setup an Incoming Webhook in Mattermost, and then put the URL for that
webhook into project settings -> Services -> Slack.

Confirm that git events (push ,commit, tag, merge etc) now result in chat
messages in Mattermost.


---------------------------------------------

You can also create a Service Template for Slack (under Admin Tools),
and all new projects will inherit that Service definition

--------------------------------------------
# Slash commands -- adding issues with Slash commands

In the GitLab Master Plan live demo, we see "/issue create add new logo"

See "Set Up a Custom Command" in https://docs.mattermost.com/developer/slash-commands.html
