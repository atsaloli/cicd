# Installing GitLab

## Creating a host 

### Option 1 - GitLab only (no CI Runner)

GitLab recommends using a separate machine for each GitLab Runner for CI, so here's how to bring up a host if you want to follow that recommendation.

[For instructional purposes, in the training we'll just bring up one beefy VM and put both the GitLab UI and the GitLab CI Runner on it]

Use the official Omnibus GitLab package as recommended on https://about.gitlab.com/installation/.

Bring up the VM in the Joyent public cloud because using the Joyent UI makes me happy. There are only two applications I say that about: Joyent and GitLab.

GitLab recommends Ubuntu 16.04, so provision an Ubuntu 16.04 instance that meets the hardware requirements (https://docs.gitlab.com/ce/install/requirements.html)  of 2 CPUs, 4 GB RAM and minimum of 2 GB of swap. 
In less than a minute, it’s ready:

```
root@localhost:~# ssh 165.225.137.71
Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.3.0 x86_64)

* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage
__ . .
_| |_ | .-. . . .-. :--. |-
|_ _| ;| || |(.-' | | |
|__| `--' `-' `;-| `-' ' ' `-'
/ ; Instance (Ubuntu 16.04 20161004)
`-' https://docs.joyent.com/images/container-native-linux

root@37ee111c-e115-487b-8b2c-aca1044cca18:~#


### Option 2 (Recommended) - GitLab and GitLab CI Runner on one host

Note: GitLab recommends putting Runners on dedicated hosts but for instructional
purposes (for convenience), it's more convenient to just do it all on one host.

Let's provision the host:

- Data center: us-west-1 (closest to me)
- Hardware Virtual Machine
- Ubuntu 16 LTS (ubuntu-certified-16.04
- High CPU with 8 GB of RAM

References:
- https://docs.gitlab.com/runner/install/


## Change host name

Add DNS record (e.g. `alpha.gitlabtutorial.org`) so it's nicer to access the GitLab UI.

Change hostname of your host before installing GitLab, since GitLab UI will pick up the hostname (e.g., in "git clone" URLs)


## Installing the Omnibus package

Follow the download and installation instructions on https://about.gitlab.com/downloads/#ubuntu1604


You should now be able to login and set the password for the default Administrator user, `root`

## Configure hostnames

We are going to need a dedicated virtual host for Mattermost (chat), and a virtual host for the GitLab UI.

We already created a DNS name for the GitLab UI (`alpha.gitlabtutorial.org`), 
now let's create a DNS entry for the chat (e.g., `alpha-mm.gitlabtutorial.org`

## Enable Mattermost (chat)

Enable Mattermost chat

Reference: https://docs.gitlab.com/omnibus/gitlab-mattermost/

The Omnibus package ships with Mattermost disabled, so let’s enable it.

Edit /etc/gitlab/gitlab.rb and set mattermost_external_url as per the “Getting Started” section. 

## Customize GitLab

First, let's add `git` to our `PATH` so that we can control changes to GitLab config


```bash
sudo apt install git
```

Now, let's setup our commit identity:

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

Save the original config (needs to be done as root):

```bash
cd /etc/gitlab
sudo git init
sudo git add .
sudo git commit -m 'Initial commit of out-of-the-box Omnibus GitLab config'
```
Set the `mattermost_external_url` in `gitlab.rb`:

For example:

```
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
