# Enabling Mattermost (group chat, like Slack)

## Configure hostnames

We are going to need a dedicated virtual host for Mattermost (chat), and a virtual host for the GitLab UI.

For example:
- DNS hostname for the GitLab UI (e.g., `alpha.gitlabtutorial.org`), 
- DNS hostname for the Mattermost chat (e.g., `alpha-mm.gitlabtutorial.org`

## Enabling Mattermost (chat)

The Omnibus package ships with Mattermost disabled.

Edit /etc/gitlab/gitlab.rb and set mattermost_external_url as per the “Getting Started” section of https://docs.gitlab.com/omnibus/gitlab-mattermost/
Set the `mattermost_external_url` in `gitlab.rb`:

For example:

```shell_session
root@06424d2a-3480-4b66-a52f-eb9a4af9708f:/etc/gitlab# sed -e "s:^# mattermost_external_url .*:mattermost_external_url 'http://alpha-mm.gitlabtutorial.org':" -i /etc/gitlab/gitlab.rb
root@06424d2a-3480-4b66-a52f-eb9a4af9708f:/etc/gitlab# git diff
diff --git a/gitlab.rb b/gitlab.rb
index 6caa6a7..c8393cd 100644
--- a/gitlab.rb
+++ b/gitlab.rb
@@ -730,7 +730,7 @@ external_url 'http://06424d2a-3480-4b66-a52f-eb9a4af9708f'
 # GitLab Mattermost #
 #####################

-# mattermost_external_url 'http://mattermost.example.com'
+mattermost_external_url 'http://alpha-mm.gitlabtutorial.org'
 #
 # mattermost['enable'] = false
 # mattermost['username'] = 'mattermost'
root@06424d2a-3480-4b66-a52f-eb9a4af9708f:/etc/gitlab# git commit -m 'Set mattermost_external_url' gitlab.rb
[master 7c8f0d7] Set mattermost_external_url
 1 file changed, 1 insertion(+), 1 deletion(-)
root@06424d2a-3480-4b66-a52f-eb9a4af9708f:/etc/gitlab#
```

Load the config change:
```bash
sudo gitlab-ctl reconfigure
```
The GitLab documentation says, “After you run sudo gitlab-ctl reconfigure, 
your GitLab Mattermost should now be reachable at http://mattermost.example.com 
and authorized to connect to GitLab. Authorising Mattermost with GitLab will 
allow users to use GitLab as SSO provider.”  However, I find that going to 
http://mattermost.example.com/ (or, in our case, to http://alpha-mm.gitlabtutorial.org)
results in a redirect to http://localhost/oauth/authorize which fails (that's in
version 8.13.3), or in 8.13.5, a redirect to the machine's hostname according
to the kernel, which in this case is 06424d2a-3480-4b66-a52f-eb9a4af9708f and
that's not in DNS so that fails too.

That's because GitLab guessed wrong about the GitLab external URL:

```
root@06424d2a-3480-4b66-a52f-eb9a4af9708f:/etc/gitlab# grep `hostname` gitlab.rb
external_url 'http://06424d2a-3480-4b66-a52f-eb9a4af9708f'
root@06424d2a-3480-4b66-a52f-eb9a4af9708f:/etc/gitlab#
```

Let's fix it -- I'll change it to `http://alpha-gitlab.gitlabtutorial.org`

I also need to fix it in `/etc/gitlab/gitlab-secrets.json`:

```
root@06424d2a-3480-4b66-a52f-eb9a4af9708f:/etc/gitlab# sed -e 's:06424d2a-3480-4b66-a52f-eb9a4af9708f:alpha-gitlab.gitlabtutorial.org:' -i gitlab-secrets.json
root@06424d2a-3480-4b66-a52f-eb9a4af9708f:/etc/gitlab#
```

I can then sign in using GitLab SSO, authorizing Mattermost to connect to GitLab.

I create a new team, "DevOps"; and a new channel, "www" (for mock work on our mock website).

If you have trouble signing on, see "Manually (re)authorising GitLab Mattermost with GitLab"
in https://docs.gitlab.com/omnibus/gitlab-mattermost/
